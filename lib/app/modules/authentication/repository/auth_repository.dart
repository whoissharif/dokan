import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dokan/core/utils/app_urls.dart';
import 'package:dokan/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/clients/api_client.dart';
import '../../../../core/utils/app_error.dart';
import '../../../routes/app_pages.dart';

class AuthRepository {
  Future<Either<AppError, String>> login(
      String username, String password) async {
    try {
      final response = await ApiClient().postRequest(
        AppUrls.login,
        body: {"username": username, "password": password},
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
      log(response.body);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetStorage().write("token", decodedData['token']);
        debugPrint(GetStorage().read('token'));
        Fluttertoast.showToast(
            msg: "Successfully Logged In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.offAllNamed(Routes.BOTTOM_NAV);
        return const Right('');
      } else if (response.statusCode == 403) {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            'Warning!',
            '',
            // '${decodedData['message']}',
            isDismissible: true,
            messageText: HtmlWidget(
              '''${decodedData['message']}''',
              textStyle: const TextStyle(color: AppColors.accentColor),
            ),
            backgroundColor: Colors.white,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          );
        }
        return const Left(AppError.unknownError);
      } else {
        debugPrint(response.statusCode.toString());
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            'Failed',
            'Something Went wrong',
            isDismissible: true,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          );
        }
        return const Left(AppError.unknownError);
      }
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Failed',
          'Something Went Wrong',
          isDismissible: true,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        );
      }
      return const Left(AppError.unknownError);
    }
  }

  Future<Either<AppError, String>> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    var body = {"username": userName, "email": email, "password": password};
    var headers = {"Content-Type": "application/json"};
    try {
      log('$body');
      final response = await ApiClient()
          .postJsonRequest(AppUrls.register, body: body, headers: headers);
      log(response.body);
      log(response.statusCode.toString());
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          decodedData["message"],
          isDismissible: true,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        );
        Get.offAllNamed(Routes.LOGIN);
        return const Right('');
      } else {
        debugPrint(response.statusCode.toString());
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            'Registration Failed',
            '${decodedData['message']}',
            isDismissible: true,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          );
        }
        return const Left(AppError.unknownError);
      }
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Failed',
          'Something Went Wrong',
          isDismissible: true,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        );
      }
      return const Left(AppError.unknownError);
    }
  }
}
