import 'dart:io';
import 'dart:js';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/data/model/response_book.dart';
import 'package:flutter_application_2/app/data/model/response_pinjam.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController
    with StateMixin<List<DataBook>> {
  final loadingLogin = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController hariController = TextEditingController();
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

  addPinjam(
      {required int id,
      required int userid,
      required String tanggalPinjam,
      required String tanggalKembali}) async {
    loadingLogin(true);
    try {
        final response =
            await ApiProvider.instance().post(Endpoint.pinjam,data: {
          "user_id": userid,
          "book_id": id,
          "tanggal_pinjam": "${tanggalPinjam}",
          "tanggal_kembali": "${tanggalKembali}"
        });
        if (response.statusCode == 201) {
          getData();
          Get.snackbar(
            "Pinjam Success",
            "",
          );
        } else {
          Get.snackbar("Pinjam Failed", "", backgroundColor: Colors.red);
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

  submitPinjam({required String id, required String bookJudul}) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
      barrierDismissible: false,
      context: Get.context!,
      artDialogArgs: ArtDialogArgs(
          showCancelBtn: true,
          title: "Apakah kamu akan meminjam ${bookJudul}?",
          confirmButtonText: "Pinjam",
          customColumns: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: Text(
                "Lama hari",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: TextFormField(
                controller: hariController,
                decoration: InputDecoration(
                    hintText: 'Masukan hari', border: OutlineInputBorder()),
              ),
            ),
          ]),
    );

    if (response == null) {
      return;
    }

    if (response.isTapConfirmButton) {
      if (hariController.value.text.length != 0 && hariController.value.text != "0") {
        int userid = int.parse(GetStorage().read('id').toString());
        int idbook = int.parse(id.toString());
        final String tanggalPinjam = DateFormat("yyyy-MM-dd").format(DateTime.now());
        final String tanggalKembali = DateFormat("yyyy-MM-dd").format(DateTime.now()
            .add(Duration(days: int.parse(hariController.text.toString()))));
        addPinjam(
            id: idbook,
            userid: userid,
            tanggalKembali: tanggalKembali,
            tanggalPinjam: tanggalPinjam);
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success, title: "Selamat Kamu Berhasil Meminjam ${bookJudul}"));
      } else {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning, title: "Tentukan Nama Hari!"));
      }
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

  // void increment() => count.value++;
}

String formatTanggal(tanggal) {
  var tanggalFormat = DateTime.parse(tanggal);
  DateFormat formatter = DateFormat('MM-dd-yyyy');
  String formatted = formatter.format(tanggalFormat);
  return formatted;
}


