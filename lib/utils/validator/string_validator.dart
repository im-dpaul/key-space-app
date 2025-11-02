import 'package:key_space_app/constants/app_constants.dart';

extension TextValidators on String {
  bool isValidEmail() => RegExp(AppConstants.emailRegex).hasMatch(trim());

  bool isValidAlpha() => RegExp(AppConstants.alphaRegex).hasMatch(trim());

  bool isValidAlphaNumeric() =>
      RegExp(AppConstants.alphaNumericRegex).hasMatch(trim());

  bool isValidCompanyName() =>
      RegExp(AppConstants.companyNameRegex).hasMatch(trim());

  bool isValidPhoneNumber() {
    String regexPattern = AppConstants.phoneRegex;
    var regExp = RegExp(regexPattern);

    if (trim().isEmpty) {
      return false;
    } else if (regExp.hasMatch(trim())) {
      return true;
    }
    return false;
  }

  bool isPhoneNumber() =>
      RegExp(AppConstants.phoneNumberRegex).hasMatch(trim());

  bool isValidPassword() => RegExp(AppConstants.passwordRegex).hasMatch(trim());

  bool isValidUrl() => RegExp(AppConstants.urlRegex).hasMatch(trim());

  bool isValidGst() => RegExp(AppConstants.gstRegex).hasMatch(trim());

  String capitalize() {
    return isNotEmpty
        ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
        : "";
  }

  String capitalizeFirstLetter() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return "";
    }
  }

  String ordinal() {
    int number = int.parse(this);

    return number > 0
        ? [
            "th",
            "st",
            "nd",
            "rd",
          ][(number > 3 && number < 21) || number % 10 > 3 ? 0 : number % 10]
        : "";
    // if (!(number >= 1 && number <= 100)) {
    //   //here you change the range
    //   throw Exception('Invalid number');
    // }
    //
    // if (number >= 11 && number <= 13) {
    //   return 'th';
    // }
    //
    // switch (number % 10) {
    //   case 1:
    //     return 'st';
    //   case 2:
    //     return 'nd';
    //   case 3:
    //     return 'rd';
    //   default:
    //     return 'th';
    // }
  }
}
