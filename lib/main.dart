import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geese_relief/state/state_dashboard.dart';
import 'package:geese_relief/state/state_login.dart';

void main() {
  runApp(
    new MaterialApp(
      home: SafeArea(child: new LauncherUI(), top: true, left: true, right: true, bottom: true,),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueGrey.shade900),
    ),
  );
}

class LauncherUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DashboardState(),
    );
  }
}
