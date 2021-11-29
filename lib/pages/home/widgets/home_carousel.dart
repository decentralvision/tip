import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip/pages/home/home_controller.dart';
import 'package:tip/styles/colors.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 12.0),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.6,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) =>
                  controller.updateCarouselIndex(index),
            ),
            items: controller.imgList.map((image) {
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                onTap: () => {},
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.imgList.map((image) {
            //these two lines
            int index = controller.imgList.indexOf(image); //are changed
            return Obx(
              () => Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.carouselIndex.value == index
                        ? AppColors.primary
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
