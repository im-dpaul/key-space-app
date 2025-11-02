import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStyles {
  AppStyles._privateConstructor();

  /// Function used to set the status bar color to the widget
  static void setStatusBarTheme({
    Color topBarColor = Colors.transparent,
    bool shouldShowDarkIcon = true,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: topBarColor, //top bar color
        statusBarIconBrightness: shouldShowDarkIcon
            ? Brightness.dark
            : Brightness.light, //top bar icons//bottom bar color
        systemNavigationBarIconBrightness: shouldShowDarkIcon
            ? Brightness.dark
            : Brightness.light, //bottom bar icons
      ),
    );
  }

  /// Function used set the device orientation of the app
  static void setDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
