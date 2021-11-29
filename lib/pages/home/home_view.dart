import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip/pages/home/home_controller.dart';
import 'package:tip/pages/home/widgets/home_carousel.dart';
import 'package:tip/pages/home/widgets/home_lives_list.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeCarousel(controller: controller),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: HomeLivesList())
          ],
        ),
      ),
    );
  }
}
