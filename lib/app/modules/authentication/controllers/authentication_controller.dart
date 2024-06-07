import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../repository/auth_repository.dart';

class AuthenticationController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController regUsernameController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController regPasswordController = TextEditingController();
  final TextEditingController regConfirmPasswordController =
      TextEditingController();
  RxBool isLoading = false.obs;

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

  Future<void> signUp() async {
    isLoading.value = true;
    var res = await AuthRepository().register(
      userName: regUsernameController.text.trim(),
      email: regEmailController.text.trim(),
      password: regPasswordController.text.trim(),
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

  Future<void> signOutAndGoToLogin() async {
    GetStorage().remove('token');

    await Get.deleteAll(force: true).then((value) => Get.toNamed(Routes.LOGIN));
  }
}
