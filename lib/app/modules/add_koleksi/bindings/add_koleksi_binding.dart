import 'package:get/get.dart';

import '../controllers/add_koleksi_controller.dart';

class AddKoleksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddKoleksiController>(
      () => AddKoleksiController(),
    );
  }
}
