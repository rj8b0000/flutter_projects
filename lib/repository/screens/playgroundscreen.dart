import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayGroundScreen extends StatefulWidget {
  const PlayGroundScreen({super.key});

  @override
  State<PlayGroundScreen> createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen> {
  Random random = new Random();
  String kick = "Kick.wav";
  final player = AudioPlayer();
  List<Color> colours = [
    Colors.white,
    Colors.red,
    Colors.black,
    Colors.yellow,
    Colors.pink,
    Colors.brown,
  ];
  List sounds = ['Kick.wav', 'Ride.wav', 'Snare.wav', 'Tom.wav'];
  int appBar = 0;
  int scaffold = 0;
  int soundPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            soundPosition = random.nextInt(4);
          },
          icon: Icon(Icons.refresh, color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: colours[appBar],
      ),
      body: MaterialButton(
        onPressed: () {
          setState(() {
            player.play(AssetSource(sounds[soundPosition]));
            appBar = random.nextInt(6);
            scaffold = random.nextInt(6);
          });
        },
        child: Center(
          child: Image.asset("assets/images/1.png", width: 200, height: 200),
        ),
      ),
      backgroundColor: colours[scaffold],
    );
  }
}
