import 'package:intl/intl.dart';

class CustomDateFormatter {
  static String formatDate(DateTime date, String pattern) {
    switch (pattern) {
      case "MM/YYYY":
        return DateFormat('MM/yyyy').format(date);
      case "YYYY-MM-DD":
        return DateFormat("yyyy-MM-dd").format(date);
      default:
        return date.toString();
    }
  }

  static String ddMMMyyyy(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }

  static String yyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String ddmmyyyy(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static String yyyy(DateTime date) {
    return DateFormat('yyyy').format(date);
  }

  static String ddMmmyyyy(DateTime date) {
    DateTime from = DateTime(date.year, date.month, date.day);
    int n = DateTime.now().difference(from).inDays;
    if (n > 0) {
      return DateFormat('dd MMM yyy').format(date);
    } else {
      n = n * -1;
      return ("${DateFormat('dd MMM yyy').format(date)},\n${(n < 31)
          ? "$n days from now"
          : n / 30 < 11
          ? "${(n / 30).round()} months from now"
          : "${(n / 365).round()} years from now"}");
    }
  }

  static String MMMMyyyy(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  static String DDDdMMMYYhhmm(DateTime date) {
    return DateFormat("E, d MMM ‘yy - h:mm a").format(date);
  }

  static String HHMMa(DateTime date) {
    return DateFormat("h:mm a").format(date);
  }

  static String dateDivider(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate == today) {
      return "Today";
    } else if (aDate == yesterday) {
      return "Yesterday";
    } else {
      return DateFormat("dd MMM, yyyy").format(date);
    }
  }
}
