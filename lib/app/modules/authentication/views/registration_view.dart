import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/input_validator.dart';
import '../../../../core/utils/size_extension.dart';
import '../../../../theme/app_color.dart';
import '../../common/widgets/app_elevated_button.dart';
import '../../common/widgets/app_form_field.dart';
import '../controllers/authentication_controller.dart';
import 'widget/social_login_button.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
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
                  60.hs,
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.shadowColor,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]),
                        child: Image.asset(
                          'assets/icons/user.png',
                          height: 32,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.shadowColor,
                                    offset: const Offset(0, 3),
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          child: Image.asset(
                            'assets/icons/camera.png',
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.hs,
                  AppFormField(
                    controller: controller.regUsernameController,
                    validator: (p0) => InputValidator.emptyFieldValidator(p0,
                        lable: 'Username'),
                    hint: 'Username',
                    leadingPath: 'assets/icons/user.png',
                  ),
                  20.hs,
                  AppFormField(
                    hint: 'Email',
                    leadingPath: 'assets/icons/mail.png',
                    controller: controller.regEmailController,
                    validator: (p0) =>
                        InputValidator.emptyFieldValidator(p0, lable: 'Email'),
                  ),
                  20.hs,
                  AppFormField(
                    hint: 'Password',
                    leadingPath: 'assets/icons/lock.png',
                    isPassword: true,
                    controller: controller.regPasswordController,
                    validator: (p0) => InputValidator.emptyFieldValidator(p0,
                        lable: 'Password'),
                  ),
                  20.hs,
                  AppFormField(
                    hint: 'Confirm Password',
                    leadingPath: 'assets/icons/lock.png',
                    isPassword: true,
                    controller: controller.regConfirmPasswordController,
                    validator: (p0) => InputValidator.confirmPasswordValidator(
                        p0, controller.regPasswordController),
                  ),
                  50.hs,
                  Obx(
                    () => AppElevatedButton(
                      text: 'Sign Up',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.signUp();
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
                  25.hs,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
