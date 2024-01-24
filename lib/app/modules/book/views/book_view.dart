import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
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
           title: Text("${state[index].judul}"),
           subtitle: Text("Ditulis by ${state[index].penulis}"),

         );
        },
        separatorBuilder: (context, index) {
         return Divider();
        },
      ))
    );
  }
}
