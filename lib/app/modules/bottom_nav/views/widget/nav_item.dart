import '../../../../../theme/app_color.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  final String imageUrl;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imageUrl,
        height: 24,
        width: 24,
        color: selectedIndex == index ? AppColors.accentColor : Colors.grey,
      ),
    );
  }
}
