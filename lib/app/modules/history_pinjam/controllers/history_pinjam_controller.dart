import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/data/constant/endpoint.dart';
import 'package:flutter_application_2/app/data/model/response_history_pinjam.dart';
import 'package:flutter_application_2/app/data/provider/api_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HistoryPinjamController extends GetxController with StateMixin<List<DataHistoryPinjam>>{
  Color color = Colors.green;
  Color statusColor(var status) {
  if (status.toString() == "DIPINJAM") {
    color = Colors.red;
    return color;
  } else {
    return color;
  }
}
String formatTanggal(tanggal) {
  var tanggalFormat = DateTime.parse(tanggal);
  DateFormat formatter = DateFormat('MM-dd-yyyy');
  String formatted = formatter.format(tanggalFormat);
  return formatted;
}
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

  Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        String id = GetStorage().read('id').toString();
        final response = await ApiProvider.instance().get(Endpoint.pinjam+"/"+id);
        if (response.statusCode == 200) {
          final ResponseHistoryPinjam responseHistoryPinjam = ResponseHistoryPinjam.fromJson(response.data);
          if(responseHistoryPinjam.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(responseHistoryPinjam.data, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
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


