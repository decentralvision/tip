import 'dart:io';

import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> load() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed('/');
  }
}
