import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:key_space_app/core/responsive/size_config.dart';

import 'package:key_space_app/locator.dart';
import 'package:key_space_app/core/theme/app_colors.dart';
import 'package:key_space_app/core/routes/app_routes.dart';
import 'package:key_space_app/services/storage/storage_utils.dart';
import 'package:key_space_app/services/firebase/firebase_init.dart';
import 'package:key_space_app/services/notification_handler/firebase_notification_handler.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  FirebaseNotificationHandler.firebaseMessagingBackgroundHandler;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  StorageUtils.showComponent(false);

  await FirebaseInit().initFirebase();
  FirebaseMessaging.onMessage.listen(FirebaseNotificationHandler.onMessage);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseNotificationHandler.killedStateMessageHandle();
  FirebaseMessaging.onMessageOpenedApp.listen(
    FirebaseNotificationHandler.handleMessage,
  );

  ChuckerFlutter.showOnRelease = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                SizeConfig().init(constraints, orientation);
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: AppColors.transparent,
                  ),
                );
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    builder: (context, child) {
                      return ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: child!,
                      );
                    },
                    title: 'KeySpace App!!',
                    theme: ThemeData(
                      fontFamily: 'Open Sans',
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      applyElevationOverlayColor: false,
                    ),
                    routerConfig: appRouter,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
