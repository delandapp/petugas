import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/app/data/constant/endpoint.dart';
import 'package:flutter_application_2/app/data/provider/api_provider.dart';
import 'package:flutter_application_2/app/modules/book/controllers/book_controller.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController {
  //TODO: Implement AddBookController
  final loadingLogin = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final BookController bookController = Get.find();

  final count = 0.obs;
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

  void increment() => count.value++;
  addBook() async {
    loadingLogin(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.book,
            data:
              {
                "judul": judulController.text.toString(),
                "penulis": penulisController.text.toString(),
                "penerbit": penerbitController.text.toString(),
                "tahun_terbit": int.parse(tahunTerbitController.text.toString())
              }
            );
        if (response.statusCode == 201) {
          bookController.getData();
          Get.back();
        } else {
          Get.snackbar("Login Failed", "Username or Password Invalid",
              backgroundColor: Colors.red);
        }
      }
      loadingLogin(false);
    } on DioException catch (e) {
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
