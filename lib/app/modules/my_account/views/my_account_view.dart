import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokan/core/utils/size_extension.dart';
import 'package:dokan/theme/app_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../controllers/my_account_controller.dart';
import 'widget/account_detail_form.dart';

class MyAccountView extends GetView<MyAccountController> {
  MyAccountView({super.key});

  final controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Obx(
        () => controller.profileError.value != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Something went wrong'),
                    GestureDetector(
                        onTap: () async {
                          await controller.fetchProfileData();
                        },
                        child: const Text(
                          'Try Again',
                          style: TextStyle(color: AppColors.accentColor),
                        )),
                  ],
                ),
              )
            : controller.isProfileLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.Circle,
                            dashPattern: const [3, 6],
                            color: AppColors.accentColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: CachedNetworkImageProvider(
                                    controller.profileModel.value!.avatarUrls!
                                        .entries.last.value),
                              ),
                            ),
                          ),
                          40.hs,
                          Text(
                            controller.profileModel.value!.firstName ?? '',
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          8.hs,
                          Text(
                            controller.profileModel.value!.email ?? '',
                          ),
                          32.hs,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor,
                                      offset: const Offset(0, 3),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                ExpansionTile(
                                  leading: Image.asset(
                                    'assets/icons/user.png',
                                    height: 24,
                                  ),
                                  title: const Text('Account'),
                                  shape: const RoundedRectangleBorder(),
                                  // initiallyExpanded: _isAccountDetailsExpanded,
                                  // onExpansionChanged: (value) {
                                  //   setState(() {
                                  //     _isAccountDetailsExpanded = value;
                                  //   });
                                  // },
                                  children: const [
                                    AccountDetailsForm(),
                                  ],
                                ),
                                const Divider(),
                                ListTile(
                                  leading: Image.asset(
                                    'assets/icons/lock.png',
                                    height: 24,
                                  ),
                                  title: const Text('Passwords'),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Fluttertoast.showToast(msg: 'Coming soon');
                                  },
                                ),
                                const Divider(),
                                ListTile(
                                  leading: Image.asset(
                                    'assets/icons/bell.png',
                                    height: 24,
                                  ),
                                  title: const Text('Notification'),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Fluttertoast.showToast(msg: 'Coming soon');
                                  },
                                ),
                                const Divider(),
                                ListTile(
                                  leading: Image.asset(
                                    'assets/icons/heart.png',
                                    height: 24,
                                  ),
                                  title: const Text('Wishlist (00)'),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    Fluttertoast.showToast(msg: 'Coming soon');
                                  },
                                ),
                              ],
                            ),
                          ),
                          120.hs,
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
