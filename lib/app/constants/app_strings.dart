/// Centralized user-facing string constants.
class AppStrings {
  AppStrings._();

  // Generic
  static const String appName = 'Noor Life';

  // Login
  static const String emailHint = 'Enter your email';
  static const String passwordHint = 'Enter your password';
  static const String login = 'Login';
  static const String register = 'Register';
  static const String noAccountPrefix = "Don't have an account? ";
  static const String signUp = 'Sign Up';
  static const String orContinueWith = 'OR CONTINUE WITH';
  static const String continueWithGoogle = 'Continue with Google';

  // Register
  static const String nameHint = 'Enter your full name';
  static const String confirmPasswordHint = 'Confirm your password';
  static const String createAccount = 'Sign Up';
  static const String haveAccountPrefix = 'Already have an account? ';

  // Validation
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Enter a valid email';
  static const String passwordRequired = 'Password is required';
  static const String nameRequired = 'Name is required';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String passwordsDoNotMatch = 'Passwords do not match';

  // Feedback
  static const String loginFailed = 'Login failed. Please try again.';
  static const String registerFailed = 'Sign up failed. Please try again.';

  // Home
  static const String homeScreen = 'Home Screen';
  static const String appNameShort = 'NoorLife';

  // Home — header
  static const String greeting = 'Assalamu Alaikum,\nTariqul \u{1F319}';
  static const String hijriDate = '9 Ramadhan 1444 H';
  static const String nextPrayerTime = '04:41 AM';
  static const String nextPrayerLabel = 'Fajr 3 hour 9 min left';

  // Home — section titles
  static const String coreFeatures = 'CORE Features';
  static const String aiAssistant = 'AI ASSISTANT';
  static const String features = 'Features';
  static const String dailyDhikr = 'DAILY DHIKR';
  static const String verseOfTheDayTitle = 'VERSE OF THE DAY';
  static const String islamicKnowledge = 'ISLAMIC KNOWLEDGE';

  // Home — daily hadith
  static const String dailyHadithTitle = 'DAILY HADTH';
  static const String dailyHadithSource = 'Sahih al-Bukhari 69';
  static const String dailyHadithText =
      '"Make things easy and do not make them difficult. Give good tidings and do not make people run away."';
  static const String dailyHadithAttribution = '- Anas Ibn Malik (RA)';

  // Home — verse of the day
  static const String verseArabic = '\u{0625}\u{0650}\u{0646}\u{064E}\u{0651} \u{0627}\u{0644}\u{0644}\u{0651}\u{064E}\u{0647}\u{064E} \u{0645}\u{064E}\u{0639}\u{064E} \u{0627}\u{0644}\u{0635}\u{0651}\u{064E}\u{0627}\u{0628}\u{0650}\u{0631}\u{0650}\u{064A}\u{0652}\u{0646}\u{064E}';
  static const String verseTranslation = '"Indeed, Allah is with the patient."';
  static const String verseReference = 'Quran 2:153';

  // Quran page
  static const String quranTitle = 'Al-Quran';
  static const String quranSubtitle = 'Explore The Holy Quran';
  static const String searchSurahsHint = 'Search Surahs...';
  static const String filterAll = 'All';
  static const String filterMeccan = 'Meccan';
  static const String filterMedinan = 'Medinan';
  static const String allSurah = 'All Surah';

  // AI Chat page
  static const String aiAssistantTitle = 'AI Islamic Assistant';
  static const String aiAssistantSubtitle =
      'Ask questions about Fiqh, Quran, Hadith, and Islamic lifestyle';
  static const String bismillahTitle = 'Bismillah';
  static const String bismillahSubtitle =
      'Ask any question about Islam and get answers\nfrom authentic sources';
  static const String aiInputHint = 'Ask a question about Islam...';
  static const String suggestionWudu = 'What breaks wudu?';
  static const String suggestionIstikhara = 'How to perform Salatul Istikhara?';
  static const String suggestionMusic = 'Is music halal in Islam?';
  static const String suggestionPillars = 'What are the pillars of Islam?';
}
