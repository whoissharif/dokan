import 'package:dokan/app/modules/common/widgets/app_bordered_form_field.dart';
import 'package:dokan/app/modules/common/widgets/app_elevated_button.dart';
import 'package:dokan/app/modules/common/widgets/app_outlined_button.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';

class AccountDetailsForm extends StatefulWidget {
  const AccountDetailsForm({super.key});

  @override
  AccountDetailsFormState createState() => AccountDetailsFormState();
}

class AccountDetailsFormState extends State<AccountDetailsForm> {
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _aptSuiteController = TextEditingController();
  final _zipCodeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _streetAddressController.dispose();
    _aptSuiteController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('First Name'),
            8.hs,
            const AppBorderedFormField(hint: 'First Name'),
            16.hs,
            const Text('Last Name'),
            8.hs,
            const AppBorderedFormField(hint: 'Last Name'),
            16.hs,
            const Text('Email'),
            8.hs,
            const AppBorderedFormField(
              hint: 'Email',
              readOnly: true,
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
                Expanded(
                  child: AppElevatedButton(
                    onTap: () {},
                    text: 'Save',
                    color: Colors.teal,
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
