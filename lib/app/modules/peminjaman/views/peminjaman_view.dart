import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> Get.toNamed(Routes.ADD_BOOK),
          child: Icon(Icons.add),
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${state[index].book?.judul}"),
              subtitle: Text("Dikembalikan ${formatTanggal(state[index].tanggalKembali)}"),

            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ))
    );
  }
}

String formatTanggal(tanggal) {
  var tanggalFormat = DateTime.parse(tanggal);
  DateFormat formatter = DateFormat('MM-dd-yyyy');
  String formatted = formatter.format(tanggalFormat);
  return formatted;
}
