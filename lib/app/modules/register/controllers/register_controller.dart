import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final loadingregister = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  postRegister() async {

    loadingregister(true);

    try {

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "telp": teleponController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString(),
            });

        if (response.statusCode == 201) {
          Get.snackbar("Information", "Register Succes", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "Register Gagal", backgroundColor: Colors.red);
        }
      }
      loadingregister(false);

    } on DioException catch (e) {
      loadingregister(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }

    } catch (e) {
      loadingregister(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
