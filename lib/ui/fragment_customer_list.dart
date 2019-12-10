import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class CustomerListFragment extends StatefulWidget {
  @override
  _CustomerListFragmentState createState() => _CustomerListFragmentState();
}

class _CustomerListFragmentState extends State<CustomerListFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Customer List", style: defaultTextStyle,),
    );
  }
}
