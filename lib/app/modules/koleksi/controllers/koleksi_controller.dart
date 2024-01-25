import 'package:dio/dio.dart';
import 'package:flutter_application_2/app/data/model/response_koleksi.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class KoleksiController extends GetxController with StateMixin<List<DataKoleksi>>{
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
        
        final response = await ApiProvider.instance().get(Endpoint.koleksi+"/"+id);
        if (response.statusCode == 200) {
          final ResponseKoleksi responseKoleksi = ResponseKoleksi.fromJson(response.data);
          if(responseKoleksi.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(responseKoleksi.data, status: RxStatus.success());
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
