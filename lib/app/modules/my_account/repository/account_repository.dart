import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dokan/core/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/clients/api_client.dart';
import '../../../../core/utils/app_error.dart';
import '../../../routes/app_pages.dart';
import '../model/profile_model.dart';

class AccountRepository {
  Future<Either<AppError, ProfileModel>> fetchProfileData() async {
    // try {
    String token = GetStorage().read("token");
    Map<String, String> headers = {"Authorization": 'Bearer $token'};
    final response =
        await ApiClient().getRequest(AppUrls.profile, headers: headers);
    log('Profile repo: ${response.body}');
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
  }
  // on SocketException {
  //   return const Left(AppError.networkError);
  // } catch (e) {
  //   return const Left(AppError.unknownError);
  // }
  // }
}
