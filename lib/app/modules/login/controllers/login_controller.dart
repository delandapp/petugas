import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/app/data/constant/endpoint.dart';
import 'package:flutter_application_2/app/data/provider/api_provider.dart';
import 'package:flutter_application_2/app/data/provider/storage_provider.dart';
import 'package:flutter_application_2/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  final loadingLogin = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    String status = StorageProvider.read(StorageKey.status);
    log("Status: ${status}" as num);
    if(status == "logged") {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  login() async {
    loadingLogin(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap({
              'username': usernameController.text.toString(),
              'password': passwordController.text.toString()
            }));
        if (response.statusCode == 200) {
          await StorageProvider.write(StorageKey.status, "logged");
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Login Failed", "Username or Password Invalid",
              backgroundColor: Colors.red);
        }
      }
      loadingLogin(false);
    } on dio.DioException catch (e) {
      loadingLogin(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loadingLogin(false);
      Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
    } 
  }
}
