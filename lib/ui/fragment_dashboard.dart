import 'package:flutter/material.dart';
import 'package:geese_relief/model/DashboardListItem.dart';
import 'package:geese_relief/utils/widget_dashboard_list_tile.dart';
import 'package:geese_relief/utils/widget_stat_item.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardFragmentState extends StatefulWidget {
  @override
  _DashboardFragmentStateState createState() => _DashboardFragmentStateState();
}

class _DashboardFragmentStateState extends State<DashboardFragmentState> {
  List<DashboardListItem> _list = [
    new DashboardListItem(
        "Ryan Marut", "Route 1 - Ryan Marut", 3, "6:37:13 AM", "7:37:14 AM"),
    new DashboardListItem(
        "Ryan Marut", "Route 1 - Ryan Marut", 3, "6:37:13 AM", "7:37:14 AM"),
    new DashboardListItem(
        "Ryan Marut", "Route 1 - Ryan Marut", 3, "6:37:13 AM", "7:37:14 AM"),
    new DashboardListItem(
        "Ryan Marut", "Route 1 - Ryan Marut", 3, "6:37:13 AM", "7:37:14 AM"),
    new DashboardListItem(
        "Ryan Marut", "Route 1 - Ryan Marut", 3, "6:37:13 AM", "7:37:14 AM"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      right: true,
      left: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: GridView.count(
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              childAspectRatio: 1,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(Icons.group, "Total Users", 29, 1),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(
                      Icons.person, "Open Customers", 19, .5),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(MdiIcons.mapMarker, "Total Routes", 9, 1),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(MdiIcons.locationEnter, "Checkins", 4808, .5),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(MdiIcons.emailOpen, "Geese Seen", 16349, .5),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: StatItem(
                      Icons.person_outline, "Closed Customers", 0, .5),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Container(child: Text("Checkin Logs in the last 24 hours", style: Theme.of(context).textTheme.title.copyWith(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,), alignment: Alignment.centerLeft, margin: EdgeInsets.only(left: 16),),
          Expanded(child: Container(child: ListView.builder(itemBuilder: (context, index)=>DashboardListTile(_list[index]), itemCount: _list.length, shrinkWrap: true, scrollDirection: Axis.vertical, physics: ScrollPhysics(),),padding: EdgeInsets.all(8),))
        ]
        ),
      ),
    );
  }
}
