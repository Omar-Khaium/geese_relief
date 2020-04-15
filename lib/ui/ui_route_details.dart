import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/route.dart' as model;
import 'package:geese_relief/ui/ui_edit_route.dart';
import 'package:geese_relief/ui/ui_show_route.dart';
import 'package:geese_relief/ui/ui_route_customer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RouteDetails extends StatefulWidget {
  final model.Route route;

  RouteDetails(this.route);

  @override
  _RouteDetailsState createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
          onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>EditRouteUI(widget.route))),
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          IconButton(
            onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>RouteCustomers(widget.route.name))),
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                MdiIcons.accountEdit,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          IconButton(
            onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ShowRoute(widget.route.name))),
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                MdiIcons.mapMarkerPath,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 172,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset("images/route.png", fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).backgroundColor,
                                Colors.white30,
                                Colors.white10,
                              ]
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        spreadRadius: 4,
                        blurRadius: 4)
                  ]),
              padding: EdgeInsets.only(top: 12),
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(MdiIcons.mapMarker,
                            size: 16, color: Colors.deepOrange.shade600),
                      ),
                    ),
                    subtitle: Text("Route"),
                    title: Text(
                      widget.route.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(MdiIcons.mapMarker,
                            size: 16, color: Colors.cyan.shade700),
                      ),
                    ),
                    subtitle: Text("Customer"),
                    title: Text(
                      widget.route.customerCount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(MdiIcons.mapMarker,
                            size: 16, color: Colors.purple.shade700),
                      ),
                    ),
                    subtitle: Text("Places"),
                    title: Text(
                      widget.route.markers.length.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
