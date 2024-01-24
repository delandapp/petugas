import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.BOOK);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book, size: 50),
                      Text("Buku", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.PEMINJAMAN);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text("Peminjaman", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
