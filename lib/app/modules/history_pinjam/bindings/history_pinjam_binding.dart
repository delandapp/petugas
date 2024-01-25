import 'package:get/get.dart';

import '../controllers/history_pinjam_controller.dart';

class HistoryPinjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPinjamController>(
      () => HistoryPinjamController(),
    );
  }
}
