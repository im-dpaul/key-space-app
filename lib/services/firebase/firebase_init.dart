import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:key_space_app/firebase_options.dart';
import 'package:key_space_app/core/theme/app_styles.dart';

// import 'package:key_space_app/core/routes/app_routes.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseInit {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  final log = Logger();

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      name: 'KeySpaceApp',
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    FirebaseAnalytics.instance.logEvent(name: 'KeySpaceApp');

    //  Setting Status Bar
    AppStyles.setStatusBarTheme(
      topBarColor: Colors.black,
      shouldShowDarkIcon: false,
    );

    // Setting Orientation of Device
    AppStyles.setDeviceOrientationOfApp();

    //initialise crashlytrics
    await initCrashlytics();

    //initialise dynamic link
    // await initDynamicLinks();
  }

  ///init crashlytics
  Future<void> initCrashlytics() async {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }
  }

  ///fetch FCM
  Future<String> fetchFcmToken() async {
    String? token = await _firebaseMessaging.getToken();
    return token!;
  }

  // ///initialise dynamic link
  // Future<void> initDynamicLinks() async {
  //   try {
  //     FirebaseDynamicLinks.instance.onLink.listen((
  //       PendingDynamicLinkData dynamicLink,
  //     ) async {
  //       String path = dynamicLink.link.path;

  //       appRouter.go(path);
  //     });

  //     final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance
  //         .getInitialLink();
  //     final Uri? deepLink = data?.link;

  //     if (deepLink != null) {
  //       String path = deepLink.path;

  //       appRouter.go(path);
  //     }
  //   } catch (e) {
  //     log.e(e.toString());
  //   }
  // }
}
