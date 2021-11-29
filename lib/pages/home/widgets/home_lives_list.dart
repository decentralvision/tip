import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLivesList extends StatelessWidget {
  const HomeLivesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.sensors_rounded, color: Colors.red),
            title: Text('Stream do Morum'),
            subtitle: Text('Minecraft'),
            trailing: FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(Icons.sensors_rounded, color: Colors.red),
            title: Text('Stream do Bruno'),
            subtitle: Text('Counter-Strike: Global Offensive'),
            trailing: FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(Icons.sensors_rounded, color: Colors.red),
            title: Text('Stream do Yero'),
            subtitle: Text('Runescape'),
            trailing: FaIcon(
              FontAwesomeIcons.commentDots,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(Icons.sensors_rounded, color: Colors.red),
            title: Text('Stream do Shark'),
            subtitle: Text('League of Legends'),
            trailing: FaIcon(
              FontAwesomeIcons.gamepad,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(Icons.sensors_rounded, color: Colors.red),
            title: Text('Stream do Zé'),
            subtitle: Text('Only Chatting'),
            trailing: FaIcon(
              FontAwesomeIcons.commentDots,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(Icons.sensors_rounded),
            title: Text('Stream do Pepe'),
            subtitle: Text('Offline'),
            trailing: FaIcon(
              FontAwesomeIcons.bell,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
