import 'dart:ui';

import 'package:flutter/material.dart';

class ImageBackgroundWidget extends StatelessWidget {
  final String url;

  ImageBackgroundWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        child: Image.asset(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
