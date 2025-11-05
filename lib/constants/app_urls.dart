class AppURLs {
  AppURLs._privateConstructor();

  static String baseURL = "https://api.keyspace.app/v1/";

  static String userProfile = "users/profile";

  static String appConfig = "common/config";
  static String registerDeviceToken = "common/devices";

  static String verifyOtp = "common/verify-otp";
  static String categories = "common/categories";
  static String cities = "location/cities";
  static String privacyPolicy = "common/privacy-policy";
  static String tnc = "common/tnc";
  static String verifyUser = "users/verify";
  static String autocompleteLocation = "common/search-typeahead";
  static String placesDetail = "common/places-details";

  static String socialLogin = "auth/social-login";
  static String login = "auth/login";
  static String requestOtp = "auth/request-otp";
  static String resetPassword = "auth/reset-password";
  static String register = "auth/register";
  static String changePassword = "users/change-password";
  static String uploadUrl = "common/upload-url";
  static String checkExistence = "auth/check-existence";

  static String categoriesSubcategories = "properties/categories";
  static String amenities = "properties/amenities";
  static String properties = "properties";

  static String searchProperty = "/properties/search";

  static String citiesState = "/location/cities";
}
