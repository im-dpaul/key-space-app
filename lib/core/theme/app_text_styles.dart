import 'package:flutter/material.dart';

import 'package:key_space_app/core/theme/app_colors.dart';
import 'package:key_space_app/constants/app_constants.dart';
import 'package:key_space_app/core/responsive/size_extension.dart';

class AppTextStyles {
  AppTextStyles._privateConstructor();

  static TextStyle f26w600Black = TextStyle(
    color: AppColors.pureBlack,
    fontSize: 26.t,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w600,
  );

  /// Bold
  static TextStyle tsB26 = TextStyle(
    fontSize: 26.t,
    fontWeight: FontWeight.w700,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsB24 = TextStyle(
    fontSize: 24.t,
    fontWeight: FontWeight.w700,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsB20 = TextStyle(
    fontSize: 20.t,
    fontWeight: FontWeight.w700,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsB16 = TextStyle(
    fontSize: 16.t,
    fontWeight: FontWeight.w700,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsB12 = TextStyle(
    fontSize: 12.t,
    fontWeight: FontWeight.w700,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  /// Semi-bold
  static TextStyle tsSB16 = TextStyle(
    fontSize: 16.t,
    fontWeight: FontWeight.w600,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsSB14 = TextStyle(
    fontSize: 14.t,
    fontWeight: FontWeight.w600,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsSB12 = TextStyle(
    fontSize: 12.t,
    fontWeight: FontWeight.w600,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  /// Medium
  static TextStyle tsM10 = TextStyle(
    fontSize: 10.t,
    fontWeight: FontWeight.w500,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  /// Regular
  static TextStyle tsR10 = TextStyle(
    fontSize: 10.t,
    fontWeight: FontWeight.w400,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsR8 = TextStyle(
    fontSize: 8.t,
    fontWeight: FontWeight.w400,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsR12 = TextStyle(
    fontSize: 12.t,
    fontWeight: FontWeight.w400,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle tsR14 = TextStyle(
    fontSize: 14.t,
    fontWeight: FontWeight.w400,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );

  /// Small regular
  static TextStyle tsSR10 = TextStyle(
    fontSize: 10.t,
    fontWeight: FontWeight.w300,
    color: AppColors.pureWhite,
    fontFamily: AppConstants.fontFamily,
  );
}
