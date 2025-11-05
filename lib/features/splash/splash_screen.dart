import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:key_space_app/constants/app_strings.dart';
import 'package:key_space_app/core/responsive/size_config.dart';
import 'package:key_space_app/core/responsive/size_extension.dart';
import 'package:key_space_app/core/routes/app_routes.dart';
import 'package:key_space_app/core/routes/routes_names.dart';
import 'package:key_space_app/core/theme/app_colors.dart';
import 'package:key_space_app/core/theme/app_text_styles.dart';
import 'package:key_space_app/features/splash/splash_cubit.dart';
import 'package:key_space_app/services/storage/storage_utils.dart';
import 'package:key_space_app/widgets/buttons/common_text_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: (SizeConfig.screenHeight / 5) * 3,
                  width: SizeConfig.screenWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    color: AppColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.welcomeToKeySpace,
                              style: AppTextStyles.tsB26.copyWith(
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                            Text(
                              AppStrings.splashScreenDescription,
                              style: AppTextStyles.tsR14.copyWith(
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextButton(
                              text: AppStrings.skip,
                              onTap: () {
                                if (StorageUtils.isUserExists()) {
                                  appRouter.goNamed(RoutesNames.home);
                                } else {
                                  appRouter.goNamed(RoutesNames.home);
                                }
                              },
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16.h,
                                      color: AppColors.pureWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
