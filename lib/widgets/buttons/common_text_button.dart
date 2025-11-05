import 'package:flutter/material.dart';
import 'package:key_space_app/core/theme/app_colors.dart';
import 'package:key_space_app/core/theme/app_text_styles.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isUnderline;
  final TextStyle? style;

  const CommonTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isUnderline = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        visualDensity: VisualDensity.compact,
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style:
            style ??
            AppTextStyles.tsSB14.copyWith(
              color: AppColors.primaryColor,
              decoration: isUnderline
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
      ),
    );
  }
}
