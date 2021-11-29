import 'package:get/get.dart';
import 'package:tip/pages/stores/store/store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }
}
