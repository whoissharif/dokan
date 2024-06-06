import 'dart:developer';

import 'package:dokan/app/modules/my_account/repository/account_repository.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_error.dart';
import '../model/profile_model.dart';

class MyAccountController extends GetxController {
  Rx<ProfileModel?> profileModel = Rx<ProfileModel?>(null);
  var isProfileLoading = false.obs;
  Rx<AppError?> profileError = Rx<AppError?>(null);

  @override
  onInit() async {
    super.onInit();
    await fetchProfileData();
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
}
