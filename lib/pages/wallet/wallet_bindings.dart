import 'package:get/get.dart';
import 'package:tip/pages/wallet/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
  }
}
