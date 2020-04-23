import 'package:flutter/material.dart';
import 'package:geese_relief/model/hive/search_suggestion.dart';
import 'package:geese_relief/ui/fragment_customer.dart';
import 'package:geese_relief/ui/fragment_dashboard.dart';
import 'package:geese_relief/ui/fragment_more.dart';
import 'package:geese_relief/ui/fragment_route.dart';
import 'package:geese_relief/ui/fragment_user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constraints.dart';

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

  var _geoLocator = Geolocator();
  var _locationOptions =
  LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);

  List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Dashboard")
    ),
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.mapMarker),
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
  void initState() {
    super.initState();
    initializeHive();
  }

  @override
  Widget build(BuildContext context) {
    listenToLocationChange();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          currentIndex: _currentIndex,
          unselectedLabelStyle: Theme.of(context).textTheme.caption,
          selectedLabelStyle: Theme.of(context).textTheme.caption,
          iconSize: 20,
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
    );
  }

  void listenToLocationChange() async {
    _geoLocator.getLastKnownPosition(desiredAccuracy: LocationAccuracy.bestForNavigation).then((position){
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    });
    _geoLocator.getPositionStream(_locationOptions).listen((Position position) {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    });
  }

  initializeHive() async {
    Box<SearchSuggestion> suggestionBox = await Hive.openBox("search_suggestions");
  }
}
