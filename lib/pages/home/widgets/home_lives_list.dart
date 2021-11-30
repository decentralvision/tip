import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeLivesList extends StatelessWidget {
  const HomeLivesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.sensors_rounded, color: Colors.red),
            title: const Text('Stream do Morum'),
            subtitle: const Text('Minecraft'),
            trailing: const FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
          ListTile(
            leading: const Icon(Icons.sensors_rounded, color: Colors.red),
            title: const Text('Stream do Bruno'),
            subtitle: const Text('Counter-Strike: Global Offensive'),
            trailing: const FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
          ListTile(
            leading: const Icon(Icons.sensors_rounded, color: Colors.red),
            title: const Text('Stream do Yero'),
            subtitle: const Text('Runescape'),
            trailing: const FaIcon(
              FontAwesomeIcons.commentDots,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
          ListTile(
            leading: const Icon(Icons.sensors_rounded, color: Colors.red),
            title: const Text('Stream do Shark'),
            subtitle: const Text('League of Legends'),
            trailing: const FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
          ListTile(
            leading: const Icon(Icons.sensors_rounded, color: Colors.red),
            title: const Text('Stream do Zé'),
            subtitle: const Text('Only Chatting'),
            trailing: const FaIcon(
              FontAwesomeIcons.commentDots,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
          ListTile(
            leading: const Icon(Icons.sensors_rounded),
            title: const Text('Stream do Pepe'),
            subtitle: const Text('Offline'),
            trailing: const FaIcon(
              FontAwesomeIcons.bell,
              size: 20,
            ),
            onTap: () => Get.toNamed('/stream'),
          ),
        ],
      ),
    );
  }
}
