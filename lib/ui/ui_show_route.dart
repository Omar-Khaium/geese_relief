import 'package:flutter/material.dart';
import 'package:geese_relief/utils/widget_route_map.dart';

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
      body: RouteMapWidget(),
    );
  }
}
