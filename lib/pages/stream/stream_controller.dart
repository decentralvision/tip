import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamController extends GetxController {
  RxInt tabIndex = 0.obs;

  String kNavigationExamplePage = '''
    <!DOCTYPE html><html>
    <head><title>Navigation Delegate Example</title></head>
    <body>
    <p>
    The navigation delegate is set to block navigation to the youtube website.
    </p>
    <ul>
    <ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
    <ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
    </ul>
    </body>
    </html>
  ''';

    final Completer<WebViewController> webviewController =
      Completer<WebViewController>();

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
