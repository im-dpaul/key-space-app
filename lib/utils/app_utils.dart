import 'dart:convert';

class AppUtils {
  static jsonParse(String str) {
    try {
      return jsonDecode(str).cast<String, dynamic>();
    } catch (e) {
      return str;
    }
  }

  static isObject(value) {
    if (value != null && value is Object) {
      return true;
    } else {
      return false;
    }
  }

  static isString(value) {
    if (value != null && value is String) {
      return true;
    } else {
      return false;
    }
  }

  static String formatPhoneNumber(String oldNumber) {
    if (oldNumber.isNotEmpty) {
      String newNumber = oldNumber.substring(0, 3);
      for (int i = 0; i < oldNumber.length - 4; i++) {
        newNumber += "*";
      }
      newNumber += oldNumber.substring(oldNumber.length - 3);

      return newNumber;
    } else {
      return "";
    }
  }
}
