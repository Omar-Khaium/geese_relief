import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showMessage(BuildContext context, String title, String message, Color color, IconData icon) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    backgroundColor: color,
    icon: Icon(
      icon,
      size: 24.0,
      color: Colors.white,
    ),
    duration: Duration(seconds: 4),
    leftBarIndicatorColor: Colors.white70,
    boxShadows: [
      BoxShadow(
        color: color.withOpacity(.5),
        offset: Offset(0.0, 2.0),
        blurRadius: 4.0,
      )
    ],
    title: title,
    message: message,
    shouldIconPulse: false,
  )..show(context);
}