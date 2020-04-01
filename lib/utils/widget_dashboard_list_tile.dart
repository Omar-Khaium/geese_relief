import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geese_relief/model/DashboardListItem.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardListTile extends StatelessWidget {
  final DashboardListItem item;

  DashboardListTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: <Widget>[
                  Icon(Icons.person, size: 18, color: Colors.grey,),
                  SizedBox(width: 16,),
                  Text(item.name, style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: <Widget>[
                  Icon(Icons.map, size: 18, color: Colors.grey,),
                  SizedBox(width: 16,),
                  Text(item.route, style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                children: <Widget>[
                  Icon(Icons.equalizer, size: 18, color: Colors.grey,),
                  SizedBox(width: 16,),
                  Text(item.count.toString(), style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Chip(
                    avatar: Icon(MdiIcons.locationEnter, size: 18,),
                    backgroundColor: Colors.grey.shade200,
                    label: Text(item.checkIn),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-330,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
                    ),
                  ),
                  Chip(
                    avatar: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),child: Icon(MdiIcons.locationExit, size: 18,)),
                    backgroundColor: Colors.grey.shade200,
                    label: Text(item.checkOut),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
