import 'package:dokan/app/modules/common/widgets/app_elevated_button.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/app_color.dart';
import '../../common/widgets/app_form_field.dart';
import '../controllers/authentication_controller.dart';
import 'widget/social_login_button.dart';

class RegistrationView extends GetView<AuthenticationController> {
  const RegistrationView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                const AppFormField(
                  hint: 'Name',
                  leadingPath: 'assets/icons/user.png',
                ),
                20.hs,
                const AppFormField(
                  hint: 'Email',
                  leadingPath: 'assets/icons/mail.png',
                ),
                20.hs,
                const AppFormField(
                  hint: 'Password',
                  leadingPath: 'assets/icons/lock.png',
                  isPassword: true,
                ),
                20.hs,
                const AppFormField(
                  hint: 'Confirm Password',
                  leadingPath: 'assets/icons/lock.png',
                  isPassword: true,
                ),
                50.hs,
                AppElevatedButton(
                  text: 'Sign Up',
                  onTap: () {},
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
                50.hs,
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
    );
  }
}
