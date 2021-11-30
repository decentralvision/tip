import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip/pages/stream/stream_controller.dart';
import 'package:tip/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamPage extends GetView<StreamController> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  StreamPage({Key? key}) : super(key: key); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 42.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              size: 28.0,
            ),
            onPressed: () => _key.currentState!.openDrawer(),
          ),
        ],
      ),
      drawer: const Drawer(
        child: InnerDrawer(),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            WebView(
              initialUrl: 'https://www.twitch.tv/gaules',
              javascriptMode: JavascriptMode.unrestricted,
              // onWebViewCreated: (WebViewController webViewController) {
              //   webViewController.loadUrl(Uri.dataFromString(controller.twitchEmbed,
              //           mimeType: 'text/html',
              //           encoding: Encoding.getByName('utf-8'))
              //       .toString());
              // },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              //navigationDelegate: (NavigationRequest request) {
              //   if (request.url.startsWith('https://www.youtube.com/')) {
              //     print('blocking navigation to $request}');
              //     return NavigationDecision.prevent;
              //   }
              //   print('allowing navigation to $request');
              //   return NavigationDecision.navigate;
              //},
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: AppColors.onPrimary,
          unselectedLabelStyle: const TextStyle(color: AppColors.onPrimary),
          unselectedItemColor: AppColors.onPrimaryUnselected,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
                size: 25,
              ),
              label: 'Watch',
              backgroundColor: AppColors.primary,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.poll_rounded,
                size: 25,
              ),
              label: 'Polls',
              backgroundColor: AppColors.primary,
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: FaIcon(
                    FontAwesomeIcons.fileInvoiceDollar,
                    size: 20,
                  ),
                ),
                label: 'Bet',
                backgroundColor: AppColors.primary),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: FaIcon(
                    FontAwesomeIcons.donate,
                    size: 20,
                  ),
                ),
                label: 'Donate',
                backgroundColor: AppColors.primary),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: FaIcon(
                    FontAwesomeIcons.store,
                    size: 20,
                  ),
                ),
                label: 'Store',
                backgroundColor: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
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
