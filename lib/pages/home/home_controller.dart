import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
    RxInt carouselIndex = 0.obs;

  final List<String> imgList = [
  'https://cdn1.dotesports.com/wp-content/uploads/2018/10/28230823/twitchcon1.jpg',
  'https://www.creatopy.com/blog/wp-content/uploads/2018/10/Twitch-Social-Media-Image-Size.jpg',
  'https://blog.twitch.tv/assets/uploads/5d55b5fa5ec2cda7a6f12105eb580e8c.png',
  'https://blog.twitch.tv/assets/uploads/a541be58805766f96a4411ac3869688a.png'
];

void updateCarouselIndex(index) {
    carouselIndex.value = index;
  }
}