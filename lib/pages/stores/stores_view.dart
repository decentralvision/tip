import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tip/pages/stores/stores_controller.dart';

class StoresPage extends GetView<StoresController> {
  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.25,
          child: ListView(
            children: const [
              StoreCard(
                title: 'Stream do Morum',
                game: 'Minecraft',
                online: true,
              ),
              StoreCard(
                title: 'Stream do Bruninho',
                game: 'Minecraft',
                online: true,
              ),
              StoreCard(
                title: 'Stream do Yero',
                game: 'Minecraft',
                online: true,
              ),
              StoreCard(
                title: 'Stream do Pepe',
                game: 'Minecraft',
                online: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String? title;
  final String? game;
  final bool? online;
  const StoreCard({
    this.title,
    this.game,
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
              leading: Icon(Icons.sensors_rounded,
                  color: online! ? Colors.red : null),
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
                imageUrl:
                    'https://cdn.streamelements.com/uploads/e8ee5db2-8410-4746-9ccd-0f9b51e0cc6c.jpg',
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.cover,
              ),
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
                        'Items',
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
                        'Promo',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: FaIcon(
                                FontAwesomeIcons.percentage,
                                size: 14,
                              ),
                            ),
                            Text(
                              '3',
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
                        'Avg. Price',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: FaIcon(
                                FontAwesomeIcons.thermometerQuarter,
                                size: 14,
                              ),
                            ),
                            Text(
                              '323.47',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () => Get.toNamed('/stores/id', arguments: title),
    );
  }
}
