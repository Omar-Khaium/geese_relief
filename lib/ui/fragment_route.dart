import 'package:flutter/material.dart';
import 'package:geese_relief/model/route.dart' as model;
import 'package:geese_relief/ui/ui_new_route.dart';
import 'package:geese_relief/utils/widget_route_list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RouteFragmentState extends StatefulWidget {
  @override
  _RouteFragmentStateState createState() => _RouteFragmentStateState();
}

class _RouteFragmentStateState extends State<RouteFragmentState> {
  List<model.Route> routes = [
    model.Route("Route 1 - Ryan Marut", 16, [model.LatLng(0,0)]),
    model.Route("Route 5 - Sharee", 7, [model.LatLng(0,0)]),
    model.Route("Route 6 -Liz/Jim", 45, [model.LatLng(0,0)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>NewRouteUI(), fullscreenDialog: true)),
        label: Text("New"),
        icon: Icon(MdiIcons.mapMarkerPlus),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          model.Route route = routes[index];
          return RouteListTile(route);
        },
        itemCount: routes.length,
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
