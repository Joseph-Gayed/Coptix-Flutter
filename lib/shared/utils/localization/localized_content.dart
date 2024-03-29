class LocalizationKey {
  static const String defaultLanguage = "ar";
  static const String en = "en";
  static const String ar = "ar";
  static const String fr = "fr";
  static const String welcomeToCoptix = "welcomeToCoptix";
  static const String welcome = "welcome";
  static const String home = "home";
  static const String explore = "explore";
  static const String search = "search";
  static const String myAccount = "myAccount";
  static const String save = "save";
  static const String language = "language";
  static const String playNow = "playNow";
  static const String addToMyList = "addToMyList";
  static const String notFoundScreenTitle = "notFoundScreenTitle";
  static const String notFoundErrorMessage = "notFoundErrorMessage";
  static const String emptyContentMessage = "emptyContentMessage";
  static const String season = "season";
  static const String episodes = "episodes";
  static const String related = "related";
  static const String success = "success";
  static const String noContent = "noContent";
  static const String badRequest = "badRequest";
  static const String unAuthorised = "unAuthorised";
  static const String forbidden = "forbidden";
  static const String internalServerError = "internalServerError";
  static const String notFound = "notFound";
  static const String cancel = "cancel";
  static const String connectTimeout = "connectTimeout";
  static const String receiveTimeout = "receiveTimeout";
  static const String sendTimeout = "sendTimeout";
  static const String cacheError = "cacheError";
  static const String noInternetConnection = "noInternetConnection";
  static const String unKnownError = "defaultError";

  static const String emailOrMobile = "emailOrMobile";
  static const String password = "password";
  static const String login = "login";
  static const String loginWith = "loginWith";
  static const String signup = "signup";
  static const String noAccount = "noAccount";
  static const String haveAccount = "haveAccount";
  static const String savePassword = "savePassword";
  static const String forgetPassword = "forgetPassword";
  static const String name = "Name";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";
  static const String mobile = "mobile";
  static const String passwordConfirmation = "confirmPassword";
  static const String forgetPasswordTitle = "forgetPasswordTitle";
  static const String forgetPasswordDescription = "forgetPasswordDescription";
  static const String sendTheLink = "sendTheLink";
  static const String backToLogin = "backToLogin";

  static const String emailValidation = "emailValidation";
  static const String passwordValidation = "passwordValidation";
  static const String passwordConfirmationValidation =
      "passwordConfirmationValidation";
  static const String mobileValidation = "mobileValidation";
  static const String required = "required";
  static const String checkYourMail = "checkYourMail";
  static const String searchHint = "searchHint";
  static const String noSearch = "noSearch";
  static const String myList = "myList";
  static const String profile = "profile";
  static const String accountSettings = "accountSettings";
  static const String appSettings = "appSettings";
  static const String help = "help";
  static const String contactUs = "contactUs";
  static const String logout = "logout";
  static const String logoutConfirmation = "logoutConfirmation";
  static const String accountDetails = "accountDetails";
  static const String changePassword = "changePassword";
}

const Map<String, Map<String, String>> localizedContent = {
  LocalizationKey.en: englishContent,
  LocalizationKey.ar: arabicContent,
  LocalizationKey.fr: frenchContent
};

const Map<String, String> englishContent = {
  LocalizationKey.welcomeToCoptix: 'Welcome to Coptix App',
  LocalizationKey.welcome: 'Welcome',
  LocalizationKey.home: "Home",
  LocalizationKey.explore: "Explore",
  LocalizationKey.search: "Search",
  LocalizationKey.myAccount: "Profile",
  LocalizationKey.save: "Save",
  LocalizationKey.language: "Language",
  LocalizationKey.playNow: "Play Now",
  LocalizationKey.addToMyList: "Watch Later",
  LocalizationKey.notFoundScreenTitle: "Content Error",
  LocalizationKey.notFoundErrorMessage:
      "Oops ! , We couldn't open the required screen.",
  LocalizationKey.emptyContentMessage: "We didn't find any thing to show.",
  LocalizationKey.season: "Season",
  LocalizationKey.episodes: "Episodes",
  LocalizationKey.related: "Related",
  LocalizationKey.success: "success",
  LocalizationKey.noContent: "noContent",
  LocalizationKey.badRequest: "badRequest",
  LocalizationKey.unAuthorised: "unAuthorised",
  LocalizationKey.forbidden: "forbidden",
  LocalizationKey.internalServerError: "internalServerError",
  LocalizationKey.notFound: "notFound",
  LocalizationKey.cancel: "Cancel",
  LocalizationKey.connectTimeout: "connectTimeout",
  LocalizationKey.receiveTimeout: "receiveTimeout",
  LocalizationKey.sendTimeout: "sendTimeout",
  LocalizationKey.cacheError: "cacheError",
  LocalizationKey.noInternetConnection: "noInternetConnection",
  LocalizationKey.unKnownError: "defaultError",
  LocalizationKey.emailOrMobile: "emailOrMobile",
  LocalizationKey.password: "password",
  LocalizationKey.login: "login",
  LocalizationKey.loginWith: "loginWith",
  LocalizationKey.noAccount: "Do you Have account? ",
  LocalizationKey.haveAccount: "Don't Have account? ",
  LocalizationKey.signup: "signup",
  LocalizationKey.savePassword: "savePassword",
  LocalizationKey.forgetPassword: "forgetPassword",
  LocalizationKey.name: "Name",
  LocalizationKey.firstName: "firstName",
  LocalizationKey.lastName: "lastName",
  LocalizationKey.email: "email",
  LocalizationKey.mobile: "mobile",
  LocalizationKey.passwordConfirmation: "confirmPassword",
  LocalizationKey.forgetPasswordTitle: "Forgot your password?",
  LocalizationKey.forgetPasswordDescription:
      "Please enter your registered email to receive a link to reset password.",
  LocalizationKey.sendTheLink: "Send the link",
  LocalizationKey.backToLogin: "Back to login",
  LocalizationKey.emailValidation: "Please enter an email with a valid format!",
  LocalizationKey.passwordValidation:
      "Please enter an password with a valid format!",
  LocalizationKey.passwordConfirmationValidation:
      "Password and password confirmation are not identical!",
  LocalizationKey.mobileValidation: "Please enter mobile with a valid format!",
  LocalizationKey.required: "This field is Required!",
  LocalizationKey.checkYourMail: "Please check your email!",
  LocalizationKey.searchHint: "What you are looking for?",
  LocalizationKey.myList: "My List",
  LocalizationKey.profile: "Profile",
  LocalizationKey.accountSettings: "Account Settings",
  LocalizationKey.appSettings: "App Settings",
  LocalizationKey.help: "Help",
  LocalizationKey.contactUs: "Contact Us",
  LocalizationKey.logout: "Logout",
  LocalizationKey.logoutConfirmation: "Are you sure you want to logout?",
  LocalizationKey.accountDetails: "Account Details",
  LocalizationKey.changePassword: "Change Password",
  LocalizationKey.noSearch: "No Search",
};

const Map<String, String> arabicContent = {
  LocalizationKey.welcomeToCoptix: "أهلاً بك في تطبيق كوبتكس",
  LocalizationKey.welcome: "أهلاً بك",
  LocalizationKey.home: "الرئيسية",
  LocalizationKey.explore: "تصفح",
  LocalizationKey.search: "بحث",
  LocalizationKey.myAccount: "حسابي",
  LocalizationKey.save: "حفظ",
  LocalizationKey.language: "اللغة",
  LocalizationKey.playNow: "تشغيل الان",
  LocalizationKey.addToMyList: "اضف لقائمتي",
  LocalizationKey.notFoundScreenTitle: "خطأ",
  LocalizationKey.notFoundErrorMessage:
      "عفوا, لم نتمكن من فتح الصفحة المطلوبة.",
  LocalizationKey.emptyContentMessage: "لا يوجد محتوي",
  LocalizationKey.season: "الموسم",
  LocalizationKey.episodes: "الحلقات",
  LocalizationKey.related: "ذات صلة",
  LocalizationKey.success: "نجاح",
  LocalizationKey.noContent: "لا يوجد محتوي",
  LocalizationKey.badRequest: "يرجي مراجعة البيانات",
  LocalizationKey.unAuthorised: "غير مسموح",
  LocalizationKey.forbidden: "خطا",
  LocalizationKey.internalServerError: "حدث خطا ما",
  LocalizationKey.notFound: "لا يوجد اي شي",
  LocalizationKey.cancel: "الغاء",
  LocalizationKey.connectTimeout: "انتهي الوقت",
  LocalizationKey.receiveTimeout: "انتهي الوقت",
  LocalizationKey.sendTimeout: "انتهي الوقت",
  LocalizationKey.cacheError: "خطا",
  LocalizationKey.noInternetConnection: "لا يوجد اتصال بالانترنت",
  LocalizationKey.unKnownError: "خطا",
  LocalizationKey.emailOrMobile: "البريد الإلكتروني أو رقم الهاتف",
  LocalizationKey.password: "كلمة المرور",
  LocalizationKey.login: "تسجيل دخول",
  LocalizationKey.loginWith: "أو تسجيل الدخول مع",
  LocalizationKey.signup: " تسجل جديد",
  LocalizationKey.noAccount: "ليس لديك حساب؟ ",
  LocalizationKey.haveAccount: "هل لديك حساب؟ ",
  LocalizationKey.savePassword: "حفظ كلمة المرور",
  LocalizationKey.forgetPassword: "نسيت كلمة السر؟",
  LocalizationKey.name: "الاسم",
  LocalizationKey.firstName: "الاسم الأول",
  LocalizationKey.lastName: "الاسم الأخير",
  LocalizationKey.email: "البريد الإلكتروني",
  LocalizationKey.mobile: "رقم الهاتف",
  LocalizationKey.passwordConfirmation: "تأكيد كلمة المرور",
  LocalizationKey.forgetPasswordTitle: "نسيت كلمة السر الخاصة بك؟",
  LocalizationKey.forgetPasswordDescription:
      "أدخل بريدك الإلكتروني المسجل أدناه \n لتتلقى تعليمات إعادة ضبط كلمة المرور",
  LocalizationKey.sendTheLink: "أرسل الرابط",
  LocalizationKey.backToLogin: "العودة لتسجيل الدخول",
  LocalizationKey.emailValidation: "يرجي ادخال البريد الالكتروني بشكل صحيح!",
  LocalizationKey.passwordValidation: "يرجي ادخال كلمة المرور بشكل صحيح!",
  LocalizationKey.passwordConfirmationValidation:
      "كلمة المرور و تأكيد كلمة المرور غير متطابقين!",
  LocalizationKey.mobileValidation: "يرجي ادخال رقم الهاتف بشكل صحيح!",
  LocalizationKey.required: "هذا الحقل مطلوب!",
  LocalizationKey.checkYourMail: "يرجي الذهاب لصندوق البريد الالكتروني للتفقد.",
  LocalizationKey.searchHint: "أبحث عن قداس, برامج, ترانيم, عظات ...",
  LocalizationKey.myList: "قائمتي",
  LocalizationKey.profile: "الملف الشخصي",
  LocalizationKey.accountSettings: "إعدادات الحساب",
  LocalizationKey.appSettings: "إعدادات التطبيق",
  LocalizationKey.help: "مساعدة",
  LocalizationKey.contactUs: "اتصل بنا",
  LocalizationKey.logout: "تسجيل خروج",
  LocalizationKey.logoutConfirmation: "أنت على وشك الخروج\n هل أنت متأكد؟",
  LocalizationKey.accountDetails: "التفاصيل الشخصية",
  LocalizationKey.changePassword: "تغيير كلمة المرور",
  LocalizationKey.noSearch: "لا يوجد عمليات بحث",
};

const Map<String, String> frenchContent = {
  LocalizationKey.welcomeToCoptix: "Bienvenue dans l'application Coptix",
  LocalizationKey.welcome: "Bienvenue",
  LocalizationKey.home: "Accueil",
  LocalizationKey.explore: "Explore",
  LocalizationKey.search: "Recherche",
  LocalizationKey.myAccount: "Profil",
  LocalizationKey.save: "Enregistrer",
  LocalizationKey.language: "la langue",
  LocalizationKey.playNow: "Joue",
  LocalizationKey.addToMyList: "Sauvegarder",
  LocalizationKey.notFoundScreenTitle: "Erreur de contenu",
  LocalizationKey.notFoundErrorMessage:
      "Désolé! , Nous n'avons pas pu ouvrir l'écran requis.",
  LocalizationKey.emptyContentMessage: "Nous n'avons rien trouvé à afficher",
  LocalizationKey.season: "Saison",
  LocalizationKey.episodes: "Épisodes",
  LocalizationKey.related: "En rapport",
  LocalizationKey.success: "success",
  LocalizationKey.noContent: "noContent",
  LocalizationKey.badRequest: "badRequest",
  LocalizationKey.unAuthorised: "unAuthorised",
  LocalizationKey.forbidden: "forbidden",
  LocalizationKey.internalServerError: "internalServerError",
  LocalizationKey.notFound: "notFound",
  LocalizationKey.cancel: "Cancel",
  LocalizationKey.connectTimeout: "connectTimeout",
  LocalizationKey.receiveTimeout: "receiveTimeout",
  LocalizationKey.sendTimeout: "sendTimeout",
  LocalizationKey.cacheError: "cacheError",
  LocalizationKey.noInternetConnection: "noInternetConnection",
  LocalizationKey.unKnownError: "defaultError",
  LocalizationKey.emailOrMobile: "emailOrMobile",
  LocalizationKey.password: "password",
  LocalizationKey.login: "login",
  LocalizationKey.loginWith: "loginWith",
  LocalizationKey.noAccount: "Do you Have account? ",
  LocalizationKey.haveAccount: "Don't Have account? ",
  LocalizationKey.signup: "signup",
  LocalizationKey.savePassword: "savePassword",
  LocalizationKey.forgetPassword: "forgetPassword",
  LocalizationKey.name: "Name",
  LocalizationKey.firstName: "firstName",
  LocalizationKey.lastName: "lastName",
  LocalizationKey.email: "email",
  LocalizationKey.mobile: "mobile",
  LocalizationKey.passwordConfirmation: "confirmPassword",
  LocalizationKey.forgetPasswordTitle: "Forgot your password?",
  LocalizationKey.forgetPasswordDescription:
      "Please enter your registered email to receive a link to reset password.",
  LocalizationKey.sendTheLink: "Send the link",
  LocalizationKey.backToLogin: "Back to login",
  LocalizationKey.emailValidation: "Please enter an email with a valid format!",
  LocalizationKey.passwordValidation:
      "Please enter an password with a valid format!",
  LocalizationKey.passwordConfirmationValidation:
      "Password and password confirmation are not identical!",
  LocalizationKey.mobileValidation: "Please enter mobile with a valid format!",
  LocalizationKey.required: "This field is Required!",
  LocalizationKey.checkYourMail: "Please check your email!",
  LocalizationKey.searchHint: "What you are looking for?",
  LocalizationKey.myList: "My List",
  LocalizationKey.profile: "Profile",
  LocalizationKey.accountSettings: "Account Settings",
  LocalizationKey.appSettings: "App Settings",
  LocalizationKey.help: "Help",
  LocalizationKey.contactUs: "Contact Us",
  LocalizationKey.logout: "Logout",
  LocalizationKey.logoutConfirmation: "Are you sure you want to logout?",
  LocalizationKey.accountDetails: "Account Details",
  LocalizationKey.changePassword: "Change Password",
  LocalizationKey.noSearch: "No Search",
};
