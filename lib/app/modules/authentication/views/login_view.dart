import 'package:dokan/app/modules/common/widgets/app_elevated_button.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/app_form_field.dart';
import '../controllers/authentication_controller.dart';
import 'widget/social_login_button.dart';

class LoginView extends GetView<AuthenticationController> {
  const LoginView({super.key});
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
                100.hs,
                Image.asset(
                  'assets/images/logo_full.png',
                  height: 80,
                ),
                60.hs,
                Text(
                  'Sign In',
                  style: theme.textTheme.headlineMedium!.copyWith(fontSize: 22),
                ),
                30.hs,
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
                AppElevatedButton(
                  text: 'Login',
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
    );
  }
}
