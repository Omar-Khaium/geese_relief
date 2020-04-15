import 'package:flutter/material.dart';
import 'package:geese_relief/ui/ui_dashboard.dart';

void main() {
  runApp(
    new MaterialApp(
      home: SafeArea(
        child: new LauncherUI(),
        top: true,
        left: true,
        right: true,
        bottom: true,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade900,
        primarySwatch: Colors.blueGrey,
        backgroundColor: Color(0xFFECEEF8),
        cursorColor: Colors.blueGrey.shade900
      ),
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
