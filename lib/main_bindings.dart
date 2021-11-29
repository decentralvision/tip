import 'package:get/get.dart';
import 'package:tip/pages/dashboard/dashboard_binding.dart';
import 'package:tip/pages/home/home_binding.dart';
import 'package:tip/pages/splash/splash_binding.dart';
import 'package:tip/pages/stores/stores_bindings.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies;
    DashboardBinding().dependencies;
    HomeBinding().dependencies();
    StoresBinding().dependencies();
  }
}
