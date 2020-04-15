import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/model/customer_history.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerHistoryUI extends StatelessWidget {
  final Customer customer;

  CustomerHistoryUI(this.customer);

  final List<CustomerHistory> list = [
    CustomerHistory(87084, "Martell", "Wright", "9:43:14 AM",
        "9:43:19 AM", 0),
    CustomerHistory(73871, "Nick", "Pappas", "3:17:12 PM",
        "3:24:35 PM", 0),
    CustomerHistory(73386, "Martell", "Wright", "3:40:54 PM",
        "3:40:55 PM", 25),
    CustomerHistory(73217, "Martell", "Wright", "10:41:06 AM",
        "10:56:39 AM", 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          CustomerHistory history = list[index];
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
                      Text("${history.firstName} ${history.lastName}", style: Theme.of(context).textTheme.body1,)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.equalizer, size: 18, color: Colors.grey,),
                      SizedBox(width: 16,),
                      Text(history.geeseCount.toString(), style: Theme.of(context).textTheme.body1,)
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
                        label: Text(history.checkedIn),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-344,
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
                        label: Text(history.checkedOut),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        },
        itemCount: list.length,
      ),
    );
  }
}
