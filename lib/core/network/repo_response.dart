import 'package:key_space_app/utils/exception_handler/api_exception.dart';

import 'index.dart';

class RepoResponse {
  final APIException? error;
  final SuccessResponse? data;

  RepoResponse({this.error, this.data});
}

checkResponse({required response}) {
  return response is APIException
      ? RepoResponse(error: response)
      : RepoResponse(data: SuccessResponse.fromJson(response ?? {}));
}
