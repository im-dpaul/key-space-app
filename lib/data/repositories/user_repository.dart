import 'package:key_space_app/constants/app_urls.dart';
import 'package:key_space_app/core/network/repo_response.dart';
import 'package:key_space_app/core/network/network_requestor.dart';

class UserRepository {
  Future<RepoResponse> getProfile({List<String>? queryParams}) async {
    final response = await NetworkRequester.authenticated.get(
      path: AppURLs.userProfile,
      query: {"include": queryParams?.join(",").toString()},
    );

    return checkResponse(response: response);
  }
}
