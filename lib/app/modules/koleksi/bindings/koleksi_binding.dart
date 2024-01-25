import 'package:get/get.dart';

import '../controllers/koleksi_controller.dart';

class KoleksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KoleksiController>(
      () => KoleksiController(),
    );
  }
}
