import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPeminjamanController>(
      () => AddPeminjamanController(),
    );
  }
}
