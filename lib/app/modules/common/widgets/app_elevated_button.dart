import '../../../../theme/app_color.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onTap,
    this.text = 'Continue',
    this.color = AppColors.accentColor,
    this.padding = 20.0,
    this.fontSize = 14,
    this.radius,
    this.isLoading,
  });
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  final double? padding;
  final double? fontSize;
  final double? radius;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: isLoading == true ? () {} : onTap,
      child: Container(
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
        child: Center(
          child: isLoading == true
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text!,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
