import 'dart:developer';

import 'package:dokan/app/modules/common/widgets/app_elevated_button.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:dokan/core/utils/input_validator.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/app_form_field.dart';
import '../controllers/authentication_controller.dart';
import 'widget/social_login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(AuthenticationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  100.hs,
                  Image.asset(
                    'assets/images/logo_full.png',
                    height: 80,
                  ),
                  85.hs,
                  Text(
                    'Sign In',
                    style:
                        theme.textTheme.headlineMedium!.copyWith(fontSize: 22),
                  ),
                  30.hs,
                  AppFormField(
                    controller: controller.usernameController,
                    hint: 'Username',
                    leadingPath: 'assets/icons/mail.png',
                    validator: (p0) => InputValidator.emptyFieldValidator(p0,
                        lable: 'Username'),
                  ),
                  20.hs,
                  AppFormField(
                    controller: controller.passwordController,
                    hint: 'Password',
                    leadingPath: 'assets/icons/lock.png',
                    isPassword: true,
                    validator: (p0) => InputValidator.emptyFieldValidator(p0,
                        lable: 'Password'),
                  ),
                  10.hs,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  20.hs,
                  Obx(
                    () => AppElevatedButton(
                      text: 'Login',
                      onTap: () async {
                        final form = _formKey.currentState;
                        if (form != null && form.validate()) {
                          await controller.signIn();
                          log('Form is valid');
                        } else {
                          log('Form is not valid');
                        }
                      },
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                  50.hs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialLoginButton(
                        iconUrl: 'assets/images/fb.png',
                        onPressed: () {},
                      ),
                      20.ws,
                      SocialLoginButton(
                        iconUrl: 'assets/images/google.png',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  30.hs,
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTRATION);
                    },
                    child: Text(
                      'Create New Account',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
