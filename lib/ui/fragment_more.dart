import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ui_change_password.dart';

class MoreFragmentState extends StatefulWidget {
  @override
  _MoreFragmentStateState createState() => _MoreFragmentStateState();
}

class _MoreFragmentStateState extends State<MoreFragmentState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Card(
              color: Theme.of(context).backgroundColor,
              elevation: 1,
              child: ListTile(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => ChangePasswordUI())),
                dense: false,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(MdiIcons.keyChange,
                        size: 16, color: Colors.deepPurple.shade700),
                  ),
                ),
                title: Text(
                  "Change  Password",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              color: Theme.of(context).backgroundColor,
              elevation: 1,
              child: ListTile(
                onTap: () {},
                dense: false,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(MdiIcons.logoutVariant,
                        size: 16, color: Colors.red.shade700),
                  ),
                ),
                title: Text(
                  "Logout",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
