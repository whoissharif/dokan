import 'package:flutter/material.dart';
import '../../../../theme/app_color.dart';

class AppBorderedFormField extends StatefulWidget {
  const AppBorderedFormField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.isPassword,
    this.readOnly = false,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final bool readOnly;

  @override
  State<AppBorderedFormField> createState() => _AppBorderedFormFieldState();
}

class _AppBorderedFormFieldState extends State<AppBorderedFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      obscureText: widget.isPassword == true && obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
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
          // borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
