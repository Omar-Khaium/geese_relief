import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/fragment_recommended_level_details.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/widgets/ImagePicker.dart';
import 'package:flutter_grate_app/widgets/widget_recommeded_level_card.dart';
import 'package:flutter_grate_app/widgets/widget_recommended_level_label.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new LauncherUI(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade900
      ),
    ),
  );
}

