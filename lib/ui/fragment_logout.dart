import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class LogoutFragment extends StatefulWidget {
  @override
  _LogoutFragmentState createState() => _LogoutFragmentState();
}

class _LogoutFragmentState extends State<LogoutFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Logout", style: defaultTextStyle,),
    );
  }
}
