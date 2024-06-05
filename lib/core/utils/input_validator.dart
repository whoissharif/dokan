import 'package:flutter/material.dart';

class InputValidator {
  static emptyFieldValidator(String? s, {required String lable}) {
    if (s == null || s.isEmpty) {
      return '$lable can\'t be empty';
    }
    return null;
  }

  static confirmPasswordValidator(
      String? s, TextEditingController passwordController) {
    if (s!.isEmpty || s != passwordController.text) {
      return 'Password doesn\'t match';
    }
    return null;
  }
}
