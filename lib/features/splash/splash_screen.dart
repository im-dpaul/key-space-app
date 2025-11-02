import 'package:flutter/material.dart';
import 'package:key_space_app/core/theme/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text('Splash Screen', style: AppTextStyles.f26w600Black),
        ),
      ),
    );
  }
}
