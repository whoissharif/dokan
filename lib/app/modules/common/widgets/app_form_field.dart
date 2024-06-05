import 'package:flutter/material.dart';
import '../../../../theme/app_color.dart';

class AppFormField extends StatefulWidget {
  const AppFormField({
    super.key,
    required this.hint,
    required this.leadingPath,
    this.controller,
    this.keyboardType,
    this.validator,
    this.isPassword,
  });

  final String hint;
  final String leadingPath;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? isPassword;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: AppColors.shadowColor,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword == true && obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.leadingPath,
              height: 16,
              color: AppColors.secondaryText,
            ),
          ),
          suffixIcon: widget.isPassword == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: GestureDetector(
                    child: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: obscureText
                          ? AppColors.secondaryText
                          : AppColors.ternaryText,
                    ),
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                )
              : const SizedBox(),
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
