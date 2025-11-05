import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:key_space_app/locator.dart';
import 'package:key_space_app/utils/app_utils.dart';
import 'package:key_space_app/core/routes/app_routes.dart';
import 'package:key_space_app/core/routes/routes_names.dart';
import 'package:key_space_app/core/network/repo_response.dart';
import 'package:key_space_app/core/network/success_response.dart';
import 'package:key_space_app/services/storage/storage_utils.dart';
import 'package:key_space_app/services/firebase/firebase_init.dart';
import 'package:key_space_app/data/models/onboarding/app_config.dart';
import 'package:key_space_app/data/models/onboarding/categories.dart';
import 'package:key_space_app/services/hardware_info/hardware_info.dart';
import 'package:key_space_app/data/repositories/onboarding_repository.dart';
import 'package:key_space_app/utils/exception_handler/api_exception_handler.dart';
import 'package:key_space_app/services/notification_handler/firebase_notification_handler.dart';

part 'splash_cubit.freezed.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.onboardingRepository) : super(const SplashState.initial());

  HardwareInfo? hardwareInfo = locator.get<HardwareInfo>();

  final OnboardingRepository onboardingRepository;

  init() async {
    // await _startOnBoarding();
    // FirebaseNotificationHandler.initNotificationChannel();
  }

  _startOnBoarding() async {
    await handleStartUpLogic().then((value) {
      StorageUtils.setDeviceID(hardwareInfo?.udid ?? "");
    });

    _registerFcmToken();

    _getCategories();

    var response = await onboardingRepository.getAppConfig();
    Data data = Data.fromJson(response.data?.data);
    var responseMap = AppUtils.jsonParse(data.value ?? "");
    if (!AppUtils.isObject(responseMap)) {
      return;
    }

    AppConfig appConfig = AppConfig.fromJson(responseMap);
    checkForUpdate(
      remoteBuildNumberForAndroid: appConfig.minAndroidVersion ?? "0",
      remoteBuildNumberForIOS: appConfig.minIosVersion ?? "0",
    );
  }

  Future handleStartUpLogic() async {
    await Future.wait([hardwareInfo!.init()]);
  }

  checkForUpdate({
    required String remoteBuildNumberForAndroid,
    required String remoteBuildNumberForIOS,
  }) {
    //check if you have latest build
    String appVersion = Platform.isIOS
        ? remoteBuildNumberForIOS
        : remoteBuildNumberForAndroid;
    if (appVersion.trim() == hardwareInfo!.version?.trim()) {
      //yes, check if user exist
      checkUserExist();
    } else {
      //no, route to force update screen
    }
  }

  _registerFcmToken() async {
    String fcmToken = await FirebaseInit().fetchFcmToken();

    var response = await onboardingRepository.registerDeviceToken(
      fcmToken: fcmToken,
    );

    if (response.data == null) {
      HandleError.handleError(response.error);
    }
  }

  _getCategories() async {
    RepoResponse response = await onboardingRepository.getCategories();

    if (response.data != null) {
      List<Categories> categories = [];
      for (var v in response.data?.data) {
        categories.add(Categories.fromJson(v));
      }

      StorageUtils.saveCategories(categories);
    } else {
      HandleError.handleError(response.error);
    }
  }

  checkUserExist() {
    if (StorageUtils.isUserExists()) {
      //yes, route to home screen
      appRouter.goNamed(RoutesNames.home);
    } else {
      //no, route to login page
      appRouter.goNamed(RoutesNames.home);
    }
  }
}
