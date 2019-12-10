import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class AddCustomerFragment extends StatefulWidget {
  @override
  _AddCustomerFragmentState createState() => _AddCustomerFragmentState();
}

class _AddCustomerFragmentState extends State<AddCustomerFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Add Customer", style: defaultTextStyle,),
    );
  }
}
