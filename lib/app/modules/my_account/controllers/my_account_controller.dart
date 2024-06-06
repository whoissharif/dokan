import 'dart:developer';

import 'package:dokan/app/modules/my_account/repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_error.dart';
import '../model/profile_model.dart';

class MyAccountController extends GetxController {
  Rx<ProfileModel?> profileModel = Rx<ProfileModel?>(null);
  var isProfileLoading = false.obs;
  var isProfileUpdating = false.obs;
  Rx<AppError?> profileError = Rx<AppError?>(null);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  onInit() async {
    super.onInit();
    await fetchProfileData();
    if (profileModel.value != null && profileError.value == null) {
      initTextEditingControllers();
    }
  }

  void initTextEditingControllers() {
    firstNameController.text = profileModel.value!.firstName!;
    lastNameController.text = profileModel.value!.lastName!;
    emailController.text = profileModel.value!.email!;
    usernameController.text = profileModel.value!.username!;
  }

  Future<void> fetchProfileData() async {
    isProfileLoading.value = true;
    var res = await AccountRepository().fetchProfileData();

    res.fold(
      (l) {
        isProfileLoading.value = false;
        log('Profile error');
        profileError.value = l;
      },
      (r) {
        isProfileLoading.value = false;
        profileModel.value = r;
        update();
      },
    );
  }

  Future<void> updateProfile() async {
    isProfileUpdating.value = true;
    var res = await AccountRepository().updateProfile(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );

    res.fold(
      (l) {
        isProfileUpdating.value = false;
      },
      (r) {
        isProfileUpdating.value = false;
        fetchProfileData();
        update();
      },
    );
  }
}
