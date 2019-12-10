import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new LoginUI(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
