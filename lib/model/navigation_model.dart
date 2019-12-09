import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavModel{
  String title;
  IconData icon;

  NavModel({this.title, this.icon});
}

List<NavModel> navItems = [
  NavModel(title: "Dashboard", icon: Icons.home),
  NavModel(title: "Add Customer", icon: Icons.person_add),
  NavModel(title: "Change Password", icon: MdiIcons.lockReset),
  NavModel(title: "Logout", icon: MdiIcons.logoutVariant),
];