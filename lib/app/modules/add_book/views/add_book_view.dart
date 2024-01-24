import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Container(
          child: Form(
            key: controller.formKey,
            child: Column(

              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: double.infinity,
                  child: Text("Judul", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: TextFormField(
                    controller: controller.judulController,
                    decoration: InputDecoration(hintText: 'Masukan judul buku',  border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'judul buku wajib di isi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: double.infinity,
                  child: Text("Penulis", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: TextFormField(
                    controller: controller.penulisController,
                    decoration: InputDecoration(hintText: 'Masukan penulis', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'penulis wajib di isi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: double.infinity,
                  child: Text("Penerbit", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: TextFormField(
                    controller: controller.penerbitController,
                    decoration: InputDecoration(hintText: 'Masukan penerbit', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'penerbit wajib di isi';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: double.infinity,
                  child: Text("Tahun Penerbit", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: TextFormField(
                    controller: controller.tahunTerbitController,
                    decoration: InputDecoration(hintText: 'Masukan tahun penerbit', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'tahun penerbit wajib di isi';
                      }
                      return null;
                    },
                  ),
                ),
                Obx(() => controller.loadingLogin.value
                    ? CircularProgressIndicator()
                    :  Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: () {
                      controller.addBook();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text('Add Buku'),
                    ),
                  ),
                ),
                ),
              ],
            ),
          ))
    );
  }
}
