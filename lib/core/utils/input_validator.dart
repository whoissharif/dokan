class InputValidator {
  static emptyFieldValidator(String? s, {required String lable}) {
    if (s == null || s.isEmpty) {
      return '$lable can\'t be empty';
    }
    return null;
  }
}
