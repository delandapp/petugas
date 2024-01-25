import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: ()=> Get.toNamed(Routes.ADD_KOLEKSI),
        child: Icon(Icons.add),
      ),
      body: controller.obx((state) => ListView.separated(
       itemCount: state!.length,
        itemBuilder: (context, index){
         return ListTile(
           title: Text("${state[index].book?.judul}"),
           subtitle: Text("Ditulis by ${state[index].book?.penulis}"),

         );
        },
        separatorBuilder: (context, index) {
         return Divider();
        },
      ))
    );
  }
}
