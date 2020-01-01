import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/widgets/CustomeCard.dart';
import 'package:flutter_grate_app/widgets/MediaPlayer.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade900
      ),
    ),
  );
}

