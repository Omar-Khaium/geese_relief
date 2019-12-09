import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String _text;

  TitleText(this._text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(
      _text,
      style: new TextStyle(
          fontSize: 42, color: Colors.black,
          fontFamily: "Monserrat"),
    );
  }
}
