import 'package:flutter/material.dart';

class DashboardUI extends StatefulWidget {
  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
//-------------------------------Left Navigator---------------------------------
          Expanded(
            flex: 1,
            child: new Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
