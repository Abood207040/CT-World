/// SharedPreferences keys for CT Assistant chat (single source of truth).
/// Threads are persisted so they appear under History after app restarts.
abstract final class CtChatPersistence {
  CtChatPersistence._();

  static const String threadsKey = 'ct_chat_threads_v3';
  static const String suppressWelcomeNextKey = 'ct_chatbot_suppress_welcome_next';
}
