class LocalizationKey {
  static const String defaultLanguage = "ar";
  static const String en = "en";
  static const String ar = "ar";
  static const String fr = "fr";
  static const String welcome = "welcome";
  static const String home = "home";
  static const String newAdditions = "newAdditions";
  static const String search = "search";
  static const String profile = "profile";
  static const String save = "save";
  static const String language = "language";
  static const String playNow = "playNow";
  static const String addToMyList = "addToMyList";
  static const String notFoundScreenTitle = "notFoundScreenTitle";
  static const String notFoundErrorMessage = "notFoundErrorMessage";

  static const String emptyContentMessage = "emptyContentMessage";
}

const Map<String, Map<String, String>> localizedContent = {
  LocalizationKey.en: englishContent,
  LocalizationKey.ar: arabicContent,
  LocalizationKey.fr: frenchContent
};

const Map<String, String> englishContent = {
  LocalizationKey.welcome: 'Welcome to Coptix App',
  LocalizationKey.home: "Home",
  LocalizationKey.newAdditions: "New Additions",
  LocalizationKey.search: "Search",
  LocalizationKey.profile: "Profile",
  LocalizationKey.save: "Save",
  LocalizationKey.language: "Language",
  LocalizationKey.playNow: "Play Now",
  LocalizationKey.addToMyList: "Watch Later",
  LocalizationKey.notFoundScreenTitle: "Content Error",
  LocalizationKey.notFoundErrorMessage:
      "Oops ! , We couldn't open the required screen.",
  LocalizationKey.emptyContentMessage: "We didn't find any thing to show.",
};
const Map<String, String> arabicContent = {
  LocalizationKey.welcome: "أهلاً بك في تطبيق كوبتكس",
  LocalizationKey.home: "الرئيسية",
  LocalizationKey.newAdditions: "الإضافات الجديدة",
  LocalizationKey.search: "بحث",
  LocalizationKey.profile: "حسابي",
  LocalizationKey.save: "حفظ",
  LocalizationKey.language: "اللغة",
  LocalizationKey.playNow: "تشغيل الان",
  LocalizationKey.addToMyList: "اضف لقائمتي",
  LocalizationKey.notFoundScreenTitle: "خطأ",
  LocalizationKey.notFoundErrorMessage:
      "عفوا, لم نتمكن من فتح الصفحة المطلوبة.",
  LocalizationKey.emptyContentMessage: "لا يوجد محتوي",
};
const Map<String, String> frenchContent = {
  LocalizationKey.welcome: "Bienvenue dans l'application Coptix",
  LocalizationKey.home: "Accueil",
  LocalizationKey.newAdditions: "Nouveautés",
  LocalizationKey.search: "Recherche",
  LocalizationKey.profile: "Profil",
  LocalizationKey.save: "Enregistrer",
  LocalizationKey.language: "la langue",
  LocalizationKey.playNow: "Joue",
  LocalizationKey.addToMyList: "Sauvegarder",
  LocalizationKey.notFoundScreenTitle: "Erreur de contenu",
  LocalizationKey.notFoundErrorMessage:
      "Désolé! , Nous n'avons pas pu ouvrir l'écran requis.",
  LocalizationKey.emptyContentMessage: "Nous n'avons rien trouvé à afficher",
};
