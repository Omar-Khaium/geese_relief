import 'package:flutter/material.dart';
import 'package:flutter_grate_app/ui/fragment_customer_details.dart';
import 'package:flutter_grate_app/ui/fragment_customer_list.dart';
import 'package:flutter_grate_app/ui/ui_launcher.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new CustomerDetails(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
