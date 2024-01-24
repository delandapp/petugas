import 'package:get_storage/get_storage.dart';


class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }


  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }


  static void clearAll() {
    GetStorage().erase();
  }
}


class StorageKey {
  static const String status = "status";
}
