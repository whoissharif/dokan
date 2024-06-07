import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/clients/api_client.dart';
import '../../../../core/utils/app_error.dart';
import '../model/profile_model.dart';

class AccountRepository {
  Future<Either<AppError, ProfileModel>> fetchProfileData() async {
    try {
      String token = GetStorage().read("token");
      Map<String, String> headers = {"Authorization": 'Bearer $token'};
      final response =
          await ApiClient().getRequest(AppUrls.profile, headers: headers);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetStorage().write("id", decodedData['id'].toString());
        // final decodedData = jsonDecode(response.body);
        final ProfileModel profileModel = profileModelFromJson(response.body);
        return Right(profileModel);
      } else if (response.statusCode == 401) {
        return const Left(AppError.unauthorized);
      } else if (response.statusCode == 404) {
        return const Left(AppError.notFound);
      } else {
        debugPrint(response.statusCode.toString());
        return const Left(AppError.unauthorized);
      }
    } on SocketException {
      return const Left(AppError.networkError);
    } catch (e) {
      return const Left(AppError.unknownError);
    }
  }

  Future<Either<AppError, String>> updateProfile({
    required String firstName,
    required String lastName,
  }) async {
    try {
      String token = GetStorage().read("token");
      var body = {"first_name": firstName, "last_name": lastName};
      var headers = {
        "Authorization": 'Bearer $token',
        "Content-Type": "application/json"
      };

      int userId = int.parse(GetStorage().read("id"));
      final response = await ApiClient().putJsonRequest(
        '${AppUrls.editProfile}$userId',
        body: body,
        headers: headers,
      );
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Profile Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
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
