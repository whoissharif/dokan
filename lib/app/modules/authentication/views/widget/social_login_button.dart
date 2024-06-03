

import 'package:flutter/material.dart';

import '../../../../../theme/app_color.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconUrl;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {super.key, required this.iconUrl, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  offset: const Offset(0, 3),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Image.asset(
          iconUrl,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}