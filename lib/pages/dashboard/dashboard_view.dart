import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tip/pages/dashboard/dashboard_controller.dart';
import 'package:tip/pages/home/home_view.dart';
import 'package:tip/pages/stores/stores_view.dart';
import 'package:tip/pages/wallet/wallet_view.dart';
import 'package:tip/styles/colors.dart';

class DashboardPage extends GetView<DashboardController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 28.0,
          ),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 5.0),
            child: CachedNetworkImage(
              imageUrl: 'https://i.imgur.com/OOSl4Vt.png',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 28.0,
              width: 28.0,
              color: AppColors.onPrimary,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: InnerDrawer(),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [HomePage(), StoresPage(), WalletPage()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.onPrimary,
          unselectedItemColor: AppColors.onPrimaryUnselected,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: FaIcon(
                  FontAwesomeIcons.store,
                  size: 20,
                ),
              ),
              label: 'Stores',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: FaIcon(
                  FontAwesomeIcons.wallet,
                  size: 20,
                ),
              ),
              label: 'Wallet',
            ),
          ],
        ),
      ),
    );
  }
}

class InnerDrawer extends StatelessWidget {
  const InnerDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0.0),
            ),
            color: AppColors.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0, bottom: 20.0),
                child: Icon(
                  Icons.account_circle,
                  color: AppColors.onPrimary,
                  size: 64,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.twitch,
                      size: 18,
                      color: AppColors.onPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '@JhonDoe',
                        style: TextStyle(color: AppColors.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.hive,
                      size: 18,
                      color: AppColors.onPrimary,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                      child: Text(
                        '0x71C7...976F',
                        style: TextStyle(color: AppColors.onPrimary),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text('Reefer A Friend'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Followed Streams'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Transactions'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Statistics'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {},
        ),
      ],
    );
  }
}
