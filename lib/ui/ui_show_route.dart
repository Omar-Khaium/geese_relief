import 'dart:ui';

import 'package:flutter/material.dart';

class ShowRoute extends StatelessWidget {
  final String route;

  ShowRoute(this.route);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Image.asset("images/route.png", fit: BoxFit.cover,),
      ),
    );
  }
}
