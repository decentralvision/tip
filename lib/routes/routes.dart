import 'package:get/get.dart';
import 'package:tip/pages/dashboard/dashboard_binding.dart';
import 'package:tip/pages/dashboard/dashboard_view.dart';
import 'package:tip/pages/home/home_binding.dart';
import 'package:tip/pages/home/home_view.dart';
import 'package:tip/pages/splash/splash_binding.dart';
import 'package:tip/pages/splash/splash_view.dart';
import 'package:tip/pages/stores/store/store_bindings.dart';
import 'package:tip/pages/stores/store/store_view.dart';
import 'package:tip/pages/stores/stores_bindings.dart';
import 'package:tip/pages/stores/stores_view.dart';
import 'package:tip/pages/wallet/wallet_bindings.dart';
import 'package:tip/pages/wallet/wallet_view.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: '/',
        page: () => DashboardPage(),
        binding: DashboardBinding(),
        children: [
          GetPage(
            name: '/home',
            page: () => HomePage(),
            binding: HomeBinding(),
          ),
          GetPage(
              name: '/stores',
              page: () => StoresPage(),
              binding: StoresBinding(),
              children: [
                GetPage(
                  name: '/id',
                  page: () => StorePage(),
                  binding: StoreBinding(),
                )
              ]),
          GetPage(
            name: '/wallet',
            page: () => WalletPage(),
            binding: WalletBinding(),
          ),
        ]),
  ];
}
