class ApiNames {
  static const String mockBaseUrl =
      "https://66749d9d-9d7d-4fb4-9069-636c78984a77.mock.pstmn.io/";
  static const String liveServerUrl = "http://138.3.252.27/";
  // "http://34.125.213.156/";
  // "http://138.3.252.27/";

  static const String liveBaseUrl = "$liveServerUrl/ovp_backend_2/public/api/";

  static bool isMocking = false;

  static String baseUrl = isMocking ? mockBaseUrl : liveBaseUrl;

  static const String categories = "categories";
  static const String categoriesContent = "show_contents";
  static const String home = "home";
  static const String clipDetails = "clips";
  static const String seriesDetails = "series";
  static const String search = "search";

  static const String login = "users/login";
  static const String logout = "users/logout";
  static const String signup = "users/register";
  static const String forgetPassword = "users/passwords/forget";
}
