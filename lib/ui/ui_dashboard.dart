import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_collapsing_nav.dart';

class DashboardUI extends StatefulWidget {
  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          CollapsingNavDrawer(
          ),
          Expanded(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFEBEBEB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
