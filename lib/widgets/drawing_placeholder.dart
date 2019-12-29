import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class DrawingPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Add Drawing",
        style: defaultTextStyle,
      ),
    );
  }
}
