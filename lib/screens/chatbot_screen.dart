import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../chat_persistence.dart';
import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';

// Matches home / app accent
const Color _kAccent = Color(0xFFFF6E4A);
const Color _kAccentSoft = Color(0xFFFF8F52);
const Color _kSurfaceGlass = Color(0x1AFFFFFF);

class CtChatbotScreen extends StatefulWidget {
  const CtChatbotScreen({super.key});

  @override
  State<CtChatbotScreen> createState() => _CtChatbotScreenState();
}

class _CtChatbotScreenState extends State<CtChatbotScreen>
    with WidgetsBindingObserver {
  final _storage = _LocalChatStorage();
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<_ChatThread> _threads = [];
  _ChatThread? _selectedThread;

  bool _isLoading = true;
  bool _isSending = false;

  /// After navigating back, next entry uses compact empty UI (no big welcome).
  bool _suppressFullWelcome = false;

  AppLifecycleState? _lastAppLifecycleState;

  // Replace with your NEW Gemini API key.
  static const String _apiKey = 'AIzaSyAg2cUMxnP3YF9kW4B5sa65qJpGjVQrUrs';

  late final _GeminiCtService _geminiService = _GeminiCtService(
    apiKey: _apiKey,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadThreads();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        _lastAppLifecycleState == AppLifecycleState.paused) {
      _onReturnFromBackground();
    }
    _lastAppLifecycleState = state;
  }

  /// User left the app (background) and came back — start a fresh chat.
  void _onReturnFromBackground() {
    if (!mounted || _isLoading) return;
    setState(() => _suppressFullWelcome = false);
    _createNewChat();
  }

  Future<void> _loadThreads() async {
    final threads = await _storage.loadThreads();
    final suppressWelcome =
        await _storage.readAndClearSuppressWelcomeNextOpen();

    if (!mounted) return;

    setState(() {
      _threads = threads;
      _selectedThread = threads.isNotEmpty ? threads.first : null;
      _suppressFullWelcome = suppressWelcome;
      _isLoading = false;
    });
  }

  Future<void> _saveThreads() async {
    await _storage.saveThreads(_threads);
  }

  Future<void> _createNewChat({bool closeDrawer = false}) async {
    final thread = _ChatThread(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: 'New Chat',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      messages: [],
    );

    setState(() {
      _threads.insert(0, thread);
      _selectedThread = thread;
    });

    await _saveThreads();

    if (closeDrawer && mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _deleteChat(String threadId) async {
    final wasSelected = _selectedThread?.id == threadId;

    setState(() {
      _threads.removeWhere((t) => t.id == threadId);

      if (wasSelected) {
        _selectedThread = _threads.isNotEmpty ? _threads.first : null;
      }
    });

    await _saveThreads();
  }

  Future<void> _showDeleteDialog(_ChatThread thread) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A2333),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: _kAccent.withValues(alpha: 0.25)),
        ),
        title: Text(
          _containsArabic(thread.title) ? 'حذف المحادثة؟' : 'Delete Chat?',
          style: const TextStyle(color: Colors.white),
          textDirection:
              _containsArabic(thread.title) ? TextDirection.rtl : TextDirection.ltr,
        ),
        content: Text(
          _containsArabic(thread.title)
              ? 'هل تريد حذف "${thread.title}"؟'
              : 'Do you want to delete "${thread.title}"?',
          style: const TextStyle(color: Colors.white70),
          textDirection:
              _containsArabic(thread.title) ? TextDirection.rtl : TextDirection.ltr,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              _containsArabic(thread.title) ? 'إلغاء' : 'Cancel',
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              _containsArabic(thread.title) ? 'حذف' : 'Delete',
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      await _deleteChat(thread.id);
    }
  }

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    if (text.isEmpty || _isSending) return;

    if (_selectedThread == null) {
      await _createNewChat();
    }

    final thread = _selectedThread;
    if (thread == null) return;

    final userMessage = _ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      role: 'user',
      text: text,
      createdAt: DateTime.now(),
    );

    setState(() {
      _inputController.clear();
      _isSending = true;
      thread.messages.add(userMessage);
      thread.updatedAt = DateTime.now();

      if (thread.messages.length == 1) {
        thread.title = _buildChatTitle(text);
      }

      _sortThreads();
    });

    await _saveThreads();
    _scrollToBottom();

    String reply;
    try {
      reply = await _geminiService.askCtAssistant(
        currentUserMessage: text,
        history: thread.messages,
      );
    } catch (_) {
      reply = _geminiService.fallbackFor(text, thread.messages);
    }

    final modelMessage = _ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      role: 'model',
      text: reply,
      createdAt: DateTime.now(),
    );

    if (!mounted) return;

    setState(() {
      thread.messages.add(modelMessage);
      thread.updatedAt = DateTime.now();
      _isSending = false;
      _sortThreads();
    });

    await _saveThreads();
    _scrollToBottom();
  }

  void _sortThreads() {
    _threads.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    if (_selectedThread != null && _threads.isNotEmpty) {
      _selectedThread = _threads.firstWhere(
        (t) => t.id == _selectedThread!.id,
        orElse: () => _threads.first,
      );
    }
  }

  String _buildChatTitle(String text) {
    final cleaned = text.replaceAll('\n', ' ').trim();
    if (cleaned.length <= 24) return cleaned;
    return '${cleaned.substring(0, 24)}...';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 120,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = _selectedThread?.title ?? 'CT Assistant';

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          unawaited(_storage.setSuppressWelcomeNextOpen());
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: _buildDrawer(),
        body: FadeInPage(
          child: Container(
            decoration: AppScreenBackground.decoration,
            child: SafeArea(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: _kAccent),
                    )
                  : Column(
                      children: [
                        _buildTopBar(title),
                        Expanded(
                          child: _selectedThread == null
                              ? (_suppressFullWelcome
                                  ? _buildMinimalEmptyState()
                                  : _buildEmptyState())
                              : _buildChatBody(_selectedThread!),
                        ),
                        if (_isSending) _buildThinkingIndicator(),
                        _buildComposer(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(String title) {
    final canPop = Navigator.of(context).canPop();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 14, 12),
          decoration: BoxDecoration(
            color: const Color(0xFF0E1522).withValues(alpha: 0.72),
            border: Border(
              bottom: BorderSide(
                color: _kAccent.withValues(alpha: 0.22),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              if (canPop)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _kSurfaceGlass,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              if (canPop) const SizedBox(width: 6),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _kAccent.withValues(alpha: 0.22),
                          _kAccentSoft.withValues(alpha: 0.12),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _kAccent.withValues(alpha: 0.45),
                      ),
                    ),
                    child: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'CT learning assistant',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _kSurfaceGlass,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: Icon(
                  Icons.smart_toy_rounded,
                  color: _kAccent.withValues(alpha: 0.95),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0F1624),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(22)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _kAccent.withValues(alpha: 0.95),
                      const Color(0xFFFF8F52).withValues(alpha: 0.88),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _kAccent.withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.smart_toy_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'CT Assistant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => _createNewChat(closeDrawer: true),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_rounded, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'New chat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Saved conversations on this device',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.38),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _threads.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.forum_outlined,
                            size: 48,
                            color: Colors.white.withValues(alpha: 0.25),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No history yet',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.45),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'New chats are saved here automatically',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.3),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      itemCount: _threads.length,
                      itemBuilder: (context, index) {
                        final thread = _threads[index];
                        final isSelected = _selectedThread?.id == thread.id;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                setState(() {
                                  _selectedThread = thread;
                                });
                                Navigator.pop(context);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? LinearGradient(
                                          colors: [
                                            _kAccent.withValues(alpha: 0.2),
                                            _kAccentSoft.withValues(alpha: 0.08),
                                          ],
                                        )
                                      : null,
                                  color: isSelected
                                      ? null
                                      : Colors.white.withValues(alpha: 0.04),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? _kAccent.withValues(alpha: 0.55)
                                        : Colors.white.withValues(alpha: 0.08),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.chat_bubble_rounded,
                                      color: isSelected
                                          ? _kAccent
                                          : Colors.white.withValues(alpha: 0.55),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        thread.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: isSelected ? 1 : 0.88,
                                          ),
                                          fontSize: 14,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          height: 1.25,
                                        ),
                                        textDirection:
                                            _containsArabic(thread.title)
                                                ? TextDirection.rtl
                                                : TextDirection.ltr,
                                      ),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () =>
                                          _showDeleteDialog(thread),
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.white.withValues(
                                          alpha: 0.35,
                                        ),
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }



  void _applyQuickPrompt(String text) {
    _inputController.text = text;
    setState(() {});
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _kAccent.withValues(alpha: 0.35),
                  blurRadius: 28,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _kAccent.withValues(alpha: 0.25),
                    const Color(0xFF1E2A42).withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _kAccent.withValues(alpha: 0.45),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.smart_toy_rounded,
                color: _kAccent.withValues(alpha: 0.95),
                size: 44,
              ),
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'CT Assistant',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ask about CT physics, anatomy prep, contrast, dose, and more.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.62),
              fontSize: 14.5,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 22),
          
          const SizedBox(height: 16),
          Text(
            'Tip: you can type in English or Arabic.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }

  /// Shown when user re-opens chat after pressing back (no hero / quick prompts).
  Widget _buildMinimalEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat_bubble_outline_rounded,
              size: 36,
              color: Colors.white.withValues(alpha: 0.35),
            ),
            const SizedBox(height: 14),
            Text(
              'Continue your conversation below.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBody(_ChatThread thread) {
    if (thread.messages.isEmpty) {
      return _suppressFullWelcome
          ? _buildMinimalEmptyState()
          : _buildEmptyState();
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 22),
      itemCount: thread.messages.length,
      itemBuilder: (context, index) {
        final message = thread.messages[index];
        final isUser = message.role == 'user';

        return _ChatBubble(
          message: message.text,
          isUser: isUser,
        );
      },
    );
  }

  Widget _buildThinkingIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _kAccent.withValues(alpha: 0.28),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _kAccent,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Preparing answer…',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.78),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
          decoration: BoxDecoration(
            color: const Color(0xFF0E1522).withValues(alpha: 0.82),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 24,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: StatefulBuilder(
                  builder: (context, setLocalState) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: _kAccent.withValues(alpha: 0.28),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _kAccent.withValues(alpha: 0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _inputController,
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (_) => setLocalState(() {}),
                        textDirection: _containsArabic(_inputController.text)
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          height: 1.4,
                        ),
                        strutStyle: const StrutStyle(
                          height: 1.4,
                          forceStrutHeight: true,
                        ),
                        cursorColor: _kAccent,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText:
                              'Ask about CT… / اكتب سؤالك عن CT…',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.42),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: _isSending ? null : _sendMessage,
                  child: Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isSending
                            ? [
                                Colors.white.withValues(alpha: 0.15),
                                Colors.white.withValues(alpha: 0.1),
                              ]
                            : [_kAccent, _kAccentSoft],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: _isSending
                          ? null
                          : [
                              BoxShadow(
                                color: _kAccent.withValues(alpha: 0.45),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                    ),
                    child: Icon(
                      _isSending
                          ? Icons.hourglass_top_rounded
                          : Icons.send_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const _ChatBubble({
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = _containsArabic(message);
    final maxW = MediaQuery.sizeOf(context).width * 0.86;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxW.clamp(0, 360)),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: BoxDecoration(
          gradient: isUser
              ? LinearGradient(
                  colors: [
                    _kAccent.withValues(alpha: 0.35),
                    _kAccentSoft.withValues(alpha: 0.12),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
              : LinearGradient(
                  colors: [
                    const Color(0xFF1C2738).withValues(alpha: 0.95),
                    const Color(0xFF152030).withValues(alpha: 0.88),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isUser ? 20 : 6),
            bottomRight: Radius.circular(isUser ? 6 : 20),
          ),
          border: Border.all(
            color: isUser
                ? _kAccent.withValues(alpha: 0.45)
                : Colors.white.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isUser ? 0.22 : 0.35),
              blurRadius: isUser ? 12 : 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isUser) ...[
                  Icon(
                    Icons.smart_toy_rounded,
                    size: 14,
                    color: _kAccent.withValues(alpha: 0.9),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  isUser ? 'You' : 'Assistant',
                  style: TextStyle(
                    color: isUser
                        ? Colors.white.withValues(alpha: 0.95)
                        : _kAccent.withValues(alpha: 0.95),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
                if (isUser) ...[
                  const SizedBox(width: 6),
                  Icon(
                    Icons.person_rounded,
                    size: 14,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.94),
                fontSize: 15.5,
                height: 1.52,
                fontWeight: FontWeight.w400,
              ),
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatThread {
  final String id;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  List<_ChatMessage> messages;

  _ChatThread({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'messages': messages.map((e) => e.toMap()).toList(),
    };
  }

  factory _ChatThread.fromMap(Map<String, dynamic> map) {
    return _ChatThread(
      id: map['id'],
      title: map['title'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      messages: (map['messages'] as List<dynamic>)
          .map((e) => _ChatMessage.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}

class _ChatMessage {
  final String id;
  final String role;
  final String text;
  final DateTime createdAt;

  _ChatMessage({
    required this.id,
    required this.role,
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory _ChatMessage.fromMap(Map<String, dynamic> map) {
    return _ChatMessage(
      id: map['id'],
      role: map['role'],
      text: map['text'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

class _LocalChatStorage {
  /// Call when user pops the chat screen; next push shows compact empty, not full welcome.
  Future<void> setSuppressWelcomeNextOpen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CtChatPersistence.suppressWelcomeNextKey, true);
  }

  /// One-shot: returns true once then clears.
  Future<bool> readAndClearSuppressWelcomeNextOpen() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getBool(CtChatPersistence.suppressWelcomeNextKey) ?? false;
    if (v) {
      await prefs.setBool(CtChatPersistence.suppressWelcomeNextKey, false);
    }
    return v;
  }

  Future<void> saveThreads(List<_ChatThread> threads) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(threads.map((e) => e.toMap()).toList());
    await prefs.setString(CtChatPersistence.threadsKey, encoded);
  }

  Future<List<_ChatThread>> loadThreads() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(CtChatPersistence.threadsKey);

    if (raw == null || raw.isEmpty) return [];

    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((e) => _ChatThread.fromMap(Map<String, dynamic>.from(e)))
          .toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    } catch (_) {
      return [];
    }
  }
}

class _GeminiCtService {
  final String apiKey;

  _GeminiCtService({required this.apiKey});

  static const String _model = 'gemini-2.5-flash';

  static const List<String> _ctCoreSignals = [
    'ct',
    'computed tomography',
    'cat scan',
    'x-ray',
    'xray',
    'hounsfield',
    'hu',
    'gantry',
    'detector',
    'contrast',
    'iodine',
    'renal',
    'kidney',
    'radiation',
    'dose',
    'artifact',
    'artifacts',
    'trauma',
    'stroke',
    'tumor',
    'abdomen',
    'pelvis',
    'chest',
    'brain',
    'angiography',
    'physics',
    'contraindications',
    'indications',
    'preparation',
    'advantages',
    'limitations',
    'reconstruction',
    'مقطعية',
    'التصوير المقطعي',
    'سي تي',
    'الأشعة المقطعية',
    'اشعة مقطعية',
    'أشعة مقطعية',
    'هونسفيلد',
    'الصبغة',
    'الجرعة',
    'الإشعاع',
    'الاشعاع',
    'التحضير',
    'موانع',
    'دواعي',
    'الغانتري',
    'الديتكتور',
  ];

  static const List<String> _smallTalkSignals = [
    'hi',
    'hello',
    'hey',
    'how are you',
    'good morning',
    'good evening',
    'thanks',
    'thank you',
    'ok',
    'okay',
    'bye',
    'السلام عليكم',
    'سلام',
    'مرحبا',
    'أهلا',
    'اهلا',
    'ازيك',
    'إزيك',
    'عامل ايه',
    'عامل إيه',
    'شكرا',
    'شكراً',
    'تمام',
    'باي',
  ];

  static const String _appKnowledge = '''
This app is a CT learning application.

The educational scope includes:
- What CT is
- Historical development of CT
- Basic CT physics principles
- Clinical relevance of CT
- CT components
- CT indications
- CT contraindications
- General CT preparation
- Advantages of CT
- CT limitations

Core reference facts:
- CT uses X-rays and computer processing to create cross-sectional images.
- Hounsfield Units measure tissue density in CT.
- Air is around -1000 HU, water is 0 HU, and bone may be +1000 HU or more.
- CT components include gantry, X-ray tube, detectors, collimators, DAS, operator console, computer system, high-voltage generator, patient table, injector, and cooling system.
- CT preparation can include removing metal objects, checking allergies, renal function, fasting before some contrast studies, and securing IV access if needed.
- Contraindications may include pregnancy, severe contrast allergy, renal impairment, some thyroid conditions, and metformin-related precautions in some situations.
- CT is useful in trauma, emergency imaging, oncology, and many diagnostic situations.
- CT limitations include radiation exposure, contrast risks, some artifacts, and lower soft tissue contrast than MRI in certain cases.
''';

  bool _containsArabic(String text) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  bool _looksLikeSmallTalk(String text) {
    final lower = text.toLowerCase().trim();
    for (final item in _smallTalkSignals) {
      if (lower == item.toLowerCase() || lower.contains(item.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  bool _looksCtRelated(String text) {
    final lower = text.toLowerCase().trim();
    for (final item in _ctCoreSignals) {
      if (lower.contains(item.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  bool _historyHasCtContext(List<_ChatMessage> history) {
    for (final msg in history.reversed.take(10)) {
      if (_looksCtRelated(msg.text)) return true;
    }
    return false;
  }

  bool _prefersArabic(String input, List<_ChatMessage> history) {
    if (_containsArabic(input)) return true;
    for (final msg in history.reversed.take(8)) {
      if (_containsArabic(msg.text)) return true;
    }
    return false;
  }

  String fallbackFor(String input, List<_ChatMessage> history) {
    final arabic = _prefersArabic(input, history);

    if (_looksLikeSmallTalk(input)) {
      return arabic
          ? 'أهلاً! أنا بخير، شكرًا لك. أنا مساعد متخصص في الـ CT، ويمكنني مساعدتك في أي سؤال عن الأشعة المقطعية.'
          : 'Hi! I am doing well, thank you. I am your CT assistant, and I can help you with any question about computed tomography.';
    }

    return arabic
        ? 'أنا هنا لمساعدتك في موضوعات الـ CT بشكل أساسي. اسألني أي شيء عن الأشعة المقطعية وسأشرح لك بطريقة بسيطة وواضحة.'
        : 'I am mainly here to help with CT topics. Ask me anything about computed tomography, and I will explain it clearly.';
  }

  Future<String> askCtAssistant({
    required String currentUserMessage,
    required List<_ChatMessage> history,
  }) async {
    final isArabic = _prefersArabic(currentUserMessage, history);
    final smallTalk = _looksLikeSmallTalk(currentUserMessage);
    final currentLooksCt = _looksCtRelated(currentUserMessage);
    final chatHasCtContext = _historyHasCtContext(history);

    if (!smallTalk && !currentLooksCt && !chatHasCtContext) {
      return fallbackFor(currentUserMessage, history);
    }

    final recentHistory = history.length > 18
        ? history.sublist(history.length - 18)
        : history;

    final contents = <Map<String, dynamic>>[];
    for (final msg in recentHistory) {
      contents.add({
        'role': msg.role == 'model' ? 'model' : 'user',
        'parts': [
          {'text': msg.text}
        ],
      });
    }

    final systemInstruction = isArabic
        ? '''
أنت مساعد CT داخل تطبيق تعليمي متخصص في الأشعة المقطعية.

شخصيتك:
- ودود، طبيعي، وإنساني في الكلام
- مهني ومتخصص في CT
- واضح، بسيط، ومنظم
- مناسب للطلاب والمتعلمين

قواعدك:
- يمكنك الرد بلطف وبشكل طبيعي على التحيات والكلام البسيط مثل: مرحبًا، السلام عليكم، كيف حالك، شكرًا.
- بعد التحية، وجّه الحديث بلطف إلى موضوعات CT.
- مهمتك الأساسية هي شرح موضوعات CT التعليمية داخل التطبيق.
- أجب بالعربية إذا كان المستخدم يكتب بالعربية.
- إذا كان المستخدم يكتب بالإنجليزية، يمكنك الرد بالإنجليزية.
- حافظ على سياق المحادثة داخل نفس الشات.
- إذا سأل المستخدم سؤال متابعة مثل: كيف؟ لماذا؟ اشرح أكثر، فافهمه بناءً على الرسائل السابقة ولا تعتبره موضوعًا جديدًا.
- كن إنسانيًا وسلسًا، لكن لا تخرج عن الإطار التعليمي الخاص بالـ CT إلا في التحيات القصيرة.

الموضوعات الأساسية:
- ما هو CT
- فيزياء CT
- Hounsfield Units
- مكونات جهاز CT
- دواعي وموانع الاستخدام
- التحضير للفحص
- الصبغة
- الـ artifacts
- الجرعة والإشعاع
- مزايا وقيود CT

إذا كان السؤال بعيدًا تمامًا عن CT، فرد بلطف ثم وجّه المستخدم مرة أخرى إلى موضوعات CT.
'''
        : '''
You are CT Assistant inside a CT learning app.

Your personality:
- Warm, natural, and human
- Professional and knowledgeable in CT
- Clear, simple, and well-organized
- Helpful for students and learners

Your rules:
- You may respond naturally to greetings and brief polite small talk such as hi, hello, how are you, and thanks.
- After a greeting, gently guide the conversation back to CT topics.
- Your main job is to explain CT educational content inside the app.
- Reply in Arabic if the user writes in Arabic.
- Reply in English if the user writes in English.
- Maintain context within the same chat.
- If the user asks a follow-up like how, why, or explain more, connect it to the previous messages and do not treat it as a new topic.
- Sound human and smooth, but stay within CT education except for brief greetings.

Main topics:
- What CT is
- CT physics
- Hounsfield Units
- CT scanner components
- Indications and contraindications
- Patient preparation
- Contrast studies
- Artifacts
- Radiation dose
- Advantages and limitations of CT

If the user asks something completely unrelated to CT, reply politely and guide them back to CT topics.
''';

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent',
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': apiKey,
      },
      body: jsonEncode({
        'systemInstruction': {
          'parts': [
            {'text': systemInstruction}
          ],
        },
        'contents': [
          {
            'role': 'user',
            'parts': [
              {'text': 'Use this app knowledge as reference:\n$_appKnowledge'}
            ],
          },
          ...contents,
        ],
        'generationConfig': {
          'temperature': 0.5,
          'topP': 0.9,
          'maxOutputTokens': 700,
        },
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      return fallbackFor(currentUserMessage, history);
    }

    try {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data['candidates'] as List<dynamic>?;

      if (candidates == null || candidates.isEmpty) {
        return fallbackFor(currentUserMessage, history);
      }

      final content = candidates.first['content'] as Map<String, dynamic>?;
      final parts = content?['parts'] as List<dynamic>?;

      if (parts == null || parts.isEmpty) {
        return fallbackFor(currentUserMessage, history);
      }

      final text = (parts.first['text'] ?? '').toString().trim();

      if (text.isEmpty) {
        return fallbackFor(currentUserMessage, history);
      }

      return text;
    } catch (_) {
      return fallbackFor(currentUserMessage, history);
    }
  }
}

bool _containsArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}