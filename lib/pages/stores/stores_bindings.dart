import 'package:get/get.dart';
import 'package:tip/pages/stores/stores_controller.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoresController());
  }
}
