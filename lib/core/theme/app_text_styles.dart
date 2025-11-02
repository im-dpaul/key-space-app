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
}
