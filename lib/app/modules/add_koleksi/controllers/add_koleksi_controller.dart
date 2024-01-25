import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/app/data/constant/endpoint.dart';
import 'package:flutter_application_2/app/data/model/response_book.dart';
import 'package:flutter_application_2/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddKoleksiController extends GetxController with StateMixin<List<DataBook>>{
  //TODO: Implement AddKoleksiController
  final loadingLogin = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
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

  addFavoritBook({
    required int userid,
    required int bookid
  }) async {
     loadingLogin(true);
    try {
        final response =
            await ApiProvider.instance().post(Endpoint.koleksi,data: {
    "user_id":userid,
    "book_id":bookid
        });
        if (response.statusCode == 201) {
          getData();
          Get.snackbar(
            "Koleksi Success",
            "",
          );
        } else {
          Get.snackbar("Koleksi Failed", "", backgroundColor: Colors.red);
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

  addFavorit({required String judulBook, required int idbook}) async {
    int iduser = int.parse(GetStorage().read('id').toString());
    ArtDialogResponse response = await ArtSweetAlert.show(
  barrierDismissible: false,
  context: Get.context!,
  artDialogArgs: ArtDialogArgs(
    showCancelBtn: true,
    title: "Apakah kamu yakin ingin menambahkan ${judulBook} ke favorit??",
    confirmButtonText: "Yah",
  )
);

if(response==null) {
  return;
}

if(response.isTapConfirmButton) {
  addFavoritBook(userid: iduser, bookid: idbook);
  ArtSweetAlert.show(
    context: Get.context!,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertType.success,
      title: "Saved!"
    )
  );
  return;
}

if(response.isTapDenyButton) {
  ArtSweetAlert.show(
    context: Get.context!,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertType.info,
      title: "Changes are not saved!"
    )
  );
  return;
}
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

}
