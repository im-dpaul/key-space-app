class APIException implements Exception {
  final bool? success;
  final String message;
  final Map<String, dynamic>? errors;
  final int? code;

  APIException({required this.message, this.errors, this.code, this.success});
}
