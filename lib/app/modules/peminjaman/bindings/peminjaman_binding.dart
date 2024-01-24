import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanController>(
      () => PeminjamanController(),
    );
  }
}
