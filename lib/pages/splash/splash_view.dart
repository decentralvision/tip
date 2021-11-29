import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip/pages/splash/splash_controller.dart';
import 'package:tip/styles/colors.dart';

class SplashPage extends GetView<SplashController> {
  SplashPage({
    Key? key,
  }) : super(key: key) {
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/OOSl4Vt.png',
            color: AppColors.onPrimary,
            height: 64,
            width: 64,
          ),
        ),
      ),
    );
  }
}
