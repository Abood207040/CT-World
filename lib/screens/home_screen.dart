import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ct_world/screens/chatbot_screen.dart';
import 'package:ct_world/widgets/app_screen_background.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class HomeSection {
  final String title;
  final String subtitle;
  final String route;
  final String image;
  final Color glow;
  final bool wide;

  const HomeSection({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.image,
    required this.glow,
    this.wide = false,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int? _pressedIndex;

  static const List<HomeSection> sections = [
    HomeSection(
      title: 'ABOUT CT',
      subtitle: 'Discover CT imaging basics',
      route: '/definition',
      image: 'assets/ABOUT CT.png',
      glow: Color(0xFFFF453A),
    ),
    HomeSection(
      title: 'CT  ANATOMY',
      subtitle: 'Explore CT anatomy',
      route: '/risks',
      image: 'assets/CT ANATOMY.png',
      glow: Color(0xFFFFB020),
    ),
    HomeSection(
      title: 'CT\nEXAMINATIONS',
      subtitle: 'CT scan procedures',
      route: '/protocol',
      image: 'assets/CT EXAMINATIONS.png',
      glow: Color(0xFF1E90FF),
    ),
    HomeSection(
      title: 'REFERENCES',
      subtitle: 'Trusted CT resources',
      route: '/cases',
      image: 'assets/REFERENCES.png',
      glow: Color(0xFF00D9FF),
    ),
    HomeSection(
      title: 'ABOUT US',
      subtitle: 'Our mission and team',
      route: '/usage',
      image: 'assets/ABOUT US.png',
      glow: Color(0xFF8B5CFF),
      wide: true,
    ),
  ];

  void _openCtAssistant(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CtChatbotScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      floatingActionButton:
          _currentIndex == 0 ? _buildAssistantFab(context) : null,
      body: Container(
        decoration: AppScreenBackground.decoration,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            _homeBody(),
            const SearchScreen(showBackButton: false),
            const ProfileScreen(showBackButton: false),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _homeBody() {
    final topCards = sections.where((e) => !e.wide).toList();
    final bottomCard = sections.firstWhere((e) => e.wide);

    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const SizedBox(height: 18),
            _buildWelcomeCard(),
            const SizedBox(height: 18),
            _buildSearchBar(),
            const SizedBox(height: 28),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topCards.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
                childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) {
                final section = topCards[index];
                final realIndex = sections.indexOf(section);
                return _buildReferenceCard(section, realIndex);
              },
            ),
            const SizedBox(height: 24),
            _buildWideReferenceCard(bottomCard, sections.indexOf(bottomCard)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.045),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.22),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0x14FF8A63),
                        border: Border.all(
                          color: const Color(0x44FF8A63),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x22FF8A63),
                            blurRadius: 14,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 14,
                            color: Color(0xFFFFA07A),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Medical Imaging Platform',
                            style: TextStyle(
                              color: Color(0xFFFFC3AF),
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xFFFFB08F),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'CT WORLD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.25,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'CT Learning Companion',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.2,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.35,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.045),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.07),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF43FF91),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Interactive study experience',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              GestureDetector(
  onTap: () {
    setState(() => _currentIndex = 2);
  },
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(255, 4, 4, 4).withOpacity(0.25),
            width: 1.5,
          ),
        ),
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage('assets/logo.png'),
        ),
      ),
      const SizedBox(height: 14),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/second.jpeg',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  ),
),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReferenceCard(HomeSection section, int index) {
    final bool pressed = _pressedIndex == index;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressedIndex = index),
      onTapCancel: () => setState(() => _pressedIndex = null),
      onTapUp: (_) => setState(() => _pressedIndex = null),
      onTap: () => Navigator.pushNamed(context, section.route),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 140),
        scale: pressed ? 0.985 : 1,
        child: _Neo3DTopicCard(
          title: section.title,
          subtitle: section.subtitle,
          imagePath: section.image,
          glow: section.glow,
          wide: false,
        ),
      ),
    );
  }

  Widget _buildWideReferenceCard(HomeSection section, int index) {
    final bool pressed = _pressedIndex == index;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressedIndex = index),
      onTapCancel: () => setState(() => _pressedIndex = null),
      onTapUp: (_) => setState(() => _pressedIndex = null),
      onTap: () => Navigator.pushNamed(context, section.route),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 140),
        scale: pressed ? 0.985 : 1,
        child: _Neo3DTopicCard(
          title: section.title,
          subtitle: section.subtitle,
          imagePath: section.image,
          glow: section.glow,
          wide: true,
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFF070B11).withOpacity(0.96),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.55),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFF8A63),
        unselectedItemColor: Colors.white54,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: _navIcon(Icons.home_rounded, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.search_rounded, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _navIcon(Icons.person_rounded, 2),
            label: 'Contact Us',
          ),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    final selected = _currentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(9),
      decoration: selected
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFF6E4A).withOpacity(0.18),
              border: Border.all(
                color: const Color(0xFFFF8A63).withOpacity(0.55),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF6E4A).withOpacity(0.45),
                  blurRadius: 14,
                  spreadRadius: 1,
                ),
              ],
            )
          : null,
      child: Icon(icon),
    );
  }

  Widget _buildWelcomeCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withOpacity(0.035),
            border: Border.all(color: Colors.white.withOpacity(0.07)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.22),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to CT World',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Study anatomy, examinations, and references in one focused learning space.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14),
              CircleAvatar(
                radius: 28,
                backgroundColor: Color(0x18FF7B5A),
                child: Icon(
                  Icons.medical_services_rounded,
                  color: Color(0xFFFF9B7E),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.search_rounded, color: Colors.white70),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Search CT topics...',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.tune_rounded, color: Colors.white54, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAssistantFab(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF10151E).withOpacity(0.94),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.10)),
          ),
          child: const Text(
            'CT assistant',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _openCtAssistant(context),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF6E4A), Color(0xFFFF8F52)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xAAFF6E4A).withOpacity(0.95),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.smart_toy_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class _Neo3DTopicCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color glow;
  final bool wide;

  const _Neo3DTopicCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.glow,
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = wide ? 30.0 : 28.0;
    final double height = wide ? 160.0 : 230.0;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Color.alphaBlend(
                    glow.withOpacity(0.22),
                    const Color(0xFF06090F),
                  ),
                  border: Border.all(
                    color: glow.withOpacity(0.9),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: glow.withOpacity(0.14),
                      blurRadius: 16,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final cardWidth = constraints.maxWidth;

                    final textWidth =
                        wide ? cardWidth * 0.60 : cardWidth * 0.68;
                    final imageWidth =
                        wide ? cardWidth * 0.52 : cardWidth * 0.45;
                    final imageHeight =
                        wide ? height * 0.86 : height * 0.82;

                    return Stack(
                      children: [
                        CustomPaint(
                          size: Size.infinite,
                          painter: _CardSweepPainter(glow: glow),
                        ),
                        Positioned(
                          right: wide ? 0 : 6,
                          bottom: 4,
                          width: imageWidth,
                          height: imageHeight,
                          child: _HeroObject(
                            imagePath: imagePath,
                            glow: glow,
                            wide: wide,
                          ),
                        ),
                        Positioned(
                          left: 18,
                          top: wide ? 22 : 20,
                          bottom: 5,
                          width: textWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: wide
                                      ? 22
                                      : title.contains('REFERENCES')
                                          ? 13.5
                                          : title.contains('EXAMINATIONS')
                                              ? 12.5
                                              : title.contains('ANATOMY')
                                                  ? 13.44
                                                  : 18.5,
                                  fontWeight: FontWeight.w900,
                                  height: 1.05,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                subtitle,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: wide ? 13.5 : 12.6,
                                  fontWeight: FontWeight.w400,
                                  height: 1.28,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroObject extends StatelessWidget {
  final String imagePath;
  final Color glow;
  final bool wide;

  const _HeroObject({
    required this.imagePath,
    required this.glow,
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Transform.scale(
        scale: wide ? 2.3 : 2.05,
        child: Padding(
          padding: EdgeInsets.only(
            right: wide ? 8 : 2,
            bottom: wide ? 0 : 2,
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _CardSweepPainter extends CustomPainter {
  final Color glow;

  _CardSweepPainter({required this.glow});

  @override
  void paint(Canvas canvas, Size size) {
    final sweepPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          glow.withOpacity(0.00),
          glow.withOpacity(0.00),
          glow.withOpacity(0.18),
          glow.withOpacity(0.00),
        ],
        stops: const [0.0, 0.45, 0.78, 1.0],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final path = Path()
      ..moveTo(size.width * 0.18, size.height)
      ..quadraticBezierTo(
        size.width * 0.42,
        size.height * 0.70,
        size.width * 0.66,
        size.height * 0.12,
      )
      ..quadraticBezierTo(
        size.width * 0.74,
        size.height * 0.02,
        size.width * 0.82,
        0,
      );

    canvas.drawPath(path, sweepPaint);

    final bottomGlow = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          glow.withOpacity(0.00),
          glow.withOpacity(0.16),
          glow.withOpacity(0.00),
        ],
      ).createShader(Rect.fromLTWH(0, size.height - 16, size.width, 16));

    canvas.drawRect(
      Rect.fromLTWH(18, size.height - 14, size.width - 36, 2),
      bottomGlow,
    );
  }

  @override
  bool shouldRepaint(covariant _CardSweepPainter oldDelegate) {
    return oldDelegate.glow != glow;
  }
}