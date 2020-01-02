import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/fragment_recommended_level_details.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/widgets/ImagePicker.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new CameraClass(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade900
      ),
    ),
  );
}

