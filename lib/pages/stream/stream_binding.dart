import 'package:get/get.dart';
import 'package:tip/pages/stream/stream_controller.dart';

class StreamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreamController());
  }
}
