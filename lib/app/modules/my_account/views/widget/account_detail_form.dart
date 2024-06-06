import 'package:dokan/app/modules/common/widgets/app_bordered_form_field.dart';
import 'package:dokan/app/modules/common/widgets/app_elevated_button.dart';
import 'package:dokan/app/modules/common/widgets/app_outlined_button.dart';
import 'package:dokan/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDetailsForm extends StatefulWidget {
  const AccountDetailsForm({super.key});

  @override
  AccountDetailsFormState createState() => AccountDetailsFormState();
}

class AccountDetailsFormState extends State<AccountDetailsForm> {
  final controller = Get.find<MyAccountController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email'),
            8.hs,
            AppBorderedFormField(
              hint: 'Email',
              readOnly: true,
              controller: controller.emailController,
            ),
            16.hs,
            const Text('Username'),
            8.hs,
            AppBorderedFormField(
              hint: 'Username',
              readOnly: true,
              controller: controller.usernameController,
            ),
            16.hs,
            const Text('First Name'),
            8.hs,
            AppBorderedFormField(
              hint: 'First Name',
              controller: controller.firstNameController,
            ),
            16.hs,
            const Text('Last Name'),
            8.hs,
            AppBorderedFormField(
              hint: 'Last Name',
              controller: controller.lastNameController,
            ),
            20.hs,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // 100.ws,
                Expanded(
                  child: AppOutlinedButton(
                    onTap: () {},
                    text: 'Cancel',
                  ),
                ),
                12.ws,
                Obx(
                  () => Expanded(
                    child: AppElevatedButton(
                      onTap: () async {
                        await controller.updateProfile();
                      },
                      text: 'Save',
                      color: Colors.teal,
                      isLoading: controller.isProfileUpdating.value,
                    ),
                  ),
                ),
              ],
            ),
            24.hs,
          ],
        ),
      ),
    );
  }
}
