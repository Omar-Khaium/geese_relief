import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class ChangePasswordFragment extends StatefulWidget {
  @override
  _ChangePasswordFragmentState createState() => _ChangePasswordFragmentState();
}

class _ChangePasswordFragmentState extends State<ChangePasswordFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Change Password", style: defaultTextStyle,),
    );
  }
}
