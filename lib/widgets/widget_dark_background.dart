import 'package:flutter/material.dart';

class DarkBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade900
      ),
    );
  }
}
