class SuccessResponse {
  bool? success;
  int? code;
  dynamic data;
  String? message;
  dynamic meta;

  SuccessResponse({
    this.success,
    this.code,
    this.data,
    this.message,
    this.meta,
  });

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    data = json['data'];
    meta = json['meta'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['success'] = success;
    response['code'] = code;
    response['data'] = data;
    response['meta'] = meta;
    response['message'] = message;
    return response;
  }
}

class Data {
  String? key;
  String? value;

  Data({this.key, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['key'] = key;
    response['value'] = value;
    return response;
  }
}
