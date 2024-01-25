import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_koleksi_controller.dart';

class AddKoleksiView extends GetView<AddKoleksiController> {
  const AddKoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF080ba1),
        title: const Text('Halaman Buku',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15.0,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),

      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(FontAwesomeIcons.book),
            title: Text(
              "${state[index].judul}",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Color(0xFF080ba1),
              ),
            ),
            subtitle: Text(
              "Kategori buku ${state[index].kategori?.nama}",
              style: TextStyle(
                fontSize: 14.0,
                height: 1.8,
                color: Color(0xFF61677D),
                letterSpacing: -0.3,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  controller.addFavorit(judulBook: state[index].judul.toString(), idbook: int.parse(state[index].id.toString()));
                },
                child: Text(
                  'Add Favorite',
                ),
              ),
            )

          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
      )),
    );
  }
}
