import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../repository/auth_repository.dart';

class AuthenticationController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    print('auth controller - init');
    super.onInit();
  }

  Future<void> signIn() async {
    isLoading.value = true;
    var res = await AuthRepository().login(
      usernameController.text.trim(),
      passwordController.text.trim(),
    );
    res.fold(
      (l) {
        isLoading.value = false;
      },
      (r) {
        isLoading.value = false;
      },
    );
  }
}
