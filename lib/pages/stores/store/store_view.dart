import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip/pages/stores/store/store_controller.dart';
import 'package:tip/styles/colors.dart';

class StorePage extends GetView<StoreController> {
  final String? title;
  const StorePage({
    this.title,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title!),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 42.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 80.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.62,
            children: const [
              StoreItemCard(
                title: 'Item #1',
                game: 'NFT',
                price: '12.27',
                online: true,
                image:
                    'https://cdn.streamelements.com/uploads/89e82840-d76d-45d6-8f8c-9bdf6a8f0639.jpg',
              ),
              StoreItemCard(
                title: 'Item #2',
                game: 'NFT',
                price: '59.33',
                online: true,
                image:
                    'https://cdn.streamelements.com/uploads/1b1d6f86-f7c4-499f-b84f-d1f6f13ae812.jpg',
              ),
              StoreItemCard(
                title: 'Item #3',
                game: 'Live Reward',
                price: '9.99',
                online: true,
                image:
                    'https://cdn.streamelements.com/uploads/ba39a87c-40b0-465b-941c-bdd35e13d84c.jpg',
              ),
              StoreItemCard(
                title: 'Item #4',
                game: 'IRL',
                price: '239.41',
                online: false,
                image:
                    'https://cdn.streamelements.com/uploads/6a7029b1-629d-46fb-8a33-65a1a2fcb0f8.jpg',
              ),
              StoreItemCard(
                title: 'Item #5',
                game: 'Digital',
                price: '39.23',
                online: true,
                image:
                    'https://cdn.streamelements.com/uploads/556f63fc-9516-491d-97ff-5d7ef201d98a.jpg',
              ),
              StoreItemCard(
                title: 'Item #6',
                game: 'NFT',
                price: '129.55',
                online: false,
                image:
                    'https://cdn.streamelements.com/uploads/5cd68d6f-f1cd-4e3a-99f9-88cc96d52a77.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreItemCard extends StatelessWidget {
  final String? title;
  final String? game;
  final String? image;
  final String? price;
  final bool? online;

  const StoreItemCard({
    this.title,
    this.game,
    this.image,
    this.price,
    this.online,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(title!),
              subtitle: Text(game!),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                  imageUrl: image!,
                  height: MediaQuery.of(context).size.height / 5.8,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Stock',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: FaIcon(
                                FontAwesomeIcons.cubes,
                                size: 14,
                              ),
                            ),
                            Text(
                              '31',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: FaIcon(
                                FontAwesomeIcons.btc,
                                size: 13,
                              ),
                            ),
                            Text(
                              price!,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.0),
            ),
            color: AppColors.onPrimary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StoreCartCard(
                title: title,
                game: game,
                online: online,
                price: price,
                image: image,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Container(
                    color: AppColors.primary,
                    height: 40,
                    width: 200,
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(color: AppColors.onPrimary),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StoreCartCard extends StatelessWidget {
  final String? title;
  final String? game;
  final String? image;
  final String? price;
  final bool? online;

  const StoreCartCard({
    this.title,
    this.game,
    this.image,
    this.price,
    this.online,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading:
                Icon(Icons.sensors_rounded, color: online! ? Colors.red : null),
            title: Text(title!),
            subtitle: Text(game!),
            trailing: FaIcon(
              online! ? FontAwesomeIcons.gamepad : FontAwesomeIcons.bell,
              size: 20,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: CachedNetworkImage(
                imageUrl: image!,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover),
          ),
          Container(
            margin: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Stock',
                      style: TextStyle(fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 6.0),
                            child: FaIcon(
                              FontAwesomeIcons.cubes,
                              size: 14,
                            ),
                          ),
                          Text(
                            '31',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: FaIcon(
                              FontAwesomeIcons.btc,
                              size: 13,
                            ),
                          ),
                          Text(
                            price!,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
