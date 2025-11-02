class Timeouts {
  Timeouts._privateConstructor();

  static const CONNECT_TIMEOUT = 60000;
  static const RECEIVE_TIMEOUT = 60000;
}

class AppConstants {
  AppConstants._privateConstructor();

  static const String fontFamily = 'SF-Pro-Rounded';

  static const String emailRegex =
      r"^[\w-]([\.]?[\w-])+@([\w-]+\.)+[\w-]{2,4}$";
  static const String phoneRegex =
      r'^((?:\\+|00)[17](?: |\\-)?|(?:\\+|00)[1-9]\\d{0,2}(?: |\\-)?|(?:\\+|00)1\\-\\d{3}(?: |\\-)?)?(0\\d|\\([0-9]{3}\\)|[1-9]{0,3})(?:((?: |\\-)[0-9]{2}){4}|((?:[0-9]{2}){4})|((?: |\\-)[0-9]{3}(?: |\\-)[0-9]{4})|([0-9]{7}))$';
  static const String passwordRegex =
      r"^([a-zA-Z0-9@$]|[a-zA-Z0-9@$]+(?:\s[a-zA-Z0-9@$]+)).{6,}$";
  static const String passwordCharRegex = '[a-zA-Z0-9@_]';
  static const String onlyNumberRegex = '[0-9]';
  static const String allNumberRegex = r'^(-?[0-9]*)';
  static const String onlyAlphaNumericRegex = '[0-9a-zA-Z ]';

  static const String alphaRegex = r'^[a-zA-Z]+(?: [a-zA-Z]+)*$';
  static const String onlyAlphaRegex = '[a-zA-Z ]';
  static const String alphaNumericRegex = r'^(?!.*\s{2})[a-zA-Z0-9\s]+$';
  static const String companyNameRegex =
      r'^(?!.*\.{2})(?!.*\s\s)(?!.*@@)[a-zA-Z0-9\s@.]+$';

  static const String phoneNumberRegex = r'^\+?[0-9]{1,3}-?[0-9]{3,14}$';

  static const String urlRegex = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';

  static const String gstRegex =
      r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';

  static const List<String> imageMimeType = [
    "png",
    "jpg",
    "jpeg",
    "webp",
    "avif",
  ];
  static const List<String> videoMimeType = ["mp4", "mpeg", "webm"];
  static const List<String> documentMimeType = [
    "pdf",
    "ppt",
    "txt",
    "pptx",
    "docx",
    "doc",
    "csv",
  ];
}
