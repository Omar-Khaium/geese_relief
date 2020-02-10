import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  TextStyle style;

  TextWidget(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return new Text(
      text,
      style: style,
    );
  }
}
