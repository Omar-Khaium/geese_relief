import 'package:flutter/material.dart';
import 'package:geese_relief/state/state_fragment_customer.dart';
import 'package:geese_relief/state/state_fragment_dashboard.dart';
import 'package:geese_relief/state/state_fragment_more.dart';
import 'package:geese_relief/state/state_fragment_route.dart';
import 'package:geese_relief/state/state_fragment_user.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardState extends StatefulWidget {
  @override
  _DashboardStateState createState() => _DashboardStateState();
}

class _DashboardStateState extends State<DashboardState> {
  List<Widget> _fragments = [
    DashboardFragmentState(),
    RouteFragmentState(),
    CustomerFragmentState(),
    UserFragmentState(),
    MoreFragmentState(),
  ];

  List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Dashboard")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text("Route")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text("Customer")
    ),
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.account),
      title: Text("User")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      title: Text("More")
    ),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: true,
        right: true,
        left: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white30,
            currentIndex: _currentIndex,
            items: _bottomNavItems,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: _fragments[_currentIndex],
        ),
      ),
    );
  }
}
