class ErrorResponse {
  late bool? success;
  late String message;
  late Map<String, dynamic>? errors;
  late int? code;

  ErrorResponse({this.success, required this.message, this.errors, this.code});

  ErrorResponse.fromJson(Map<String, dynamic>? json) {
    success = json?['success'];
    message = json == null ? "" : json['message'];
    errors = json?['errors'];
    code = json?['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['errors'] = errors;
    data['success'] = success;
    return data;
  }
}
