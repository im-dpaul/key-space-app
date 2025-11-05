import 'package:key_space_app/constants/app_urls.dart';
import 'package:key_space_app/core/network/network_requestor.dart';
import 'package:key_space_app/core/network/repo_response.dart';
import 'package:key_space_app/data/models/auth/signup_request.dart';

class OnboardingRepository {
  Future<RepoResponse> getAppConfig() async {
    final response = await NetworkRequester.shared.get(path: AppURLs.appConfig);
    return checkResponse(response: response);
  }

  Future<RepoResponse> registerDeviceToken({required String fcmToken}) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.registerDeviceToken,
      data: {"fcmToken": fcmToken},
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> getCategories() async {
    final response = await NetworkRequester.shared.get(
      path: AppURLs.categories,
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> socialLogin({required String uid}) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.socialLogin,
      data: {"uid": uid},
      query: {"include": "company"},
    );
    return checkResponse(response: response);
  }

  Future<RepoResponse> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.login,
      data: {"email": email.trim(), "password": password},
      query: {"include": "company"},
    );
    return checkResponse(response: response);
  }

  Future<RepoResponse> requestOtp({required Map<String, dynamic> data}) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.requestOtp,
      data: data,
    );
    return checkResponse(response: response);
  }

  Future<RepoResponse> verifyOtp({
    required String phoneNumber,
    required String otp,
    required String purpose,
  }) async {
    final response = await NetworkRequester.shared.post(
      path: purpose != "LOGIN" ? AppURLs.verifyOtp : AppURLs.login,
      query: {"include": "company"},
      data: {
        "mobileNumber": phoneNumber.trim(),
        "otp": otp,
        "purpose": purpose,
      },
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> verifyEmailOtp({
    required String email,
    required String otp,
    required String purpose,
  }) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.verifyOtp,
      data: {"email": email.trim(), "otp": otp, "purpose": purpose},
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> verifyUserEmail({
    required String otp,
    required String purpose,
  }) async {
    final response = await NetworkRequester.authenticated.post(
      path: AppURLs.verifyUser,
      data: {"otp": otp, "purpose": purpose},
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> resetPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
    required String verificationToken,
  }) async {
    final response = await NetworkRequester.shared.patch(
      path: AppURLs.resetPassword,
      data: {
        "email": email.trim(),
        "verificationToken": verificationToken,
        "newPassword": newPassword,
        "confirmPassword": confirmNewPassword,
      },
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> searchCities({required String query}) async {
    final response = await NetworkRequester.shared.get(
      path: AppURLs.cities,
      query: {'q': query, 'include': "state"},
    );

    return checkResponse(response: response);
  }

  Future<RepoResponse> getHtmlData({required String url}) async {
    final response = await NetworkRequester.shared.get(path: url);

    return checkResponse(response: response);
  }

  Future<RepoResponse> register({required SignupRequest data}) async {
    final response = await NetworkRequester.shared.post(
      path: AppURLs.register,
      data: data.toJson(),
      query: {"include": "company"},
    );

    return checkResponse(response: response);
  }
}
