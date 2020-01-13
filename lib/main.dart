import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/widgets/PDFScreen.dart';

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



