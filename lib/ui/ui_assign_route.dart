import 'package:flutter/material.dart';
import 'package:geese_relief/model/user.dart';

class AssignRouteUI extends StatefulWidget {
  final User user;

  AssignRouteUI(this.user);

  @override
  _AssignRouteUIState createState() => _AssignRouteUIState();
}

class _AssignRouteUIState extends State<AssignRouteUI> {
  List<String> _routes = [
    "Route 1 - Ryan Marut",
    "Route 2 - DAN",
    "Route 3 - Boyd",
    "Route 4 - Peggy",
    "Route 5 - Sharee",
    "Route 6 -Liz/Jim",
    "Suspended Clients",
    "Route 7 Tommy M",
    "Rogers Island"
  ];

  List<bool> _selections = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Assign Route"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (flag){
                setState(() {
                  _selections[index] = flag;
                });
              },
              title: Text(_routes[index]),
              value: _selections[index],
            ),
            itemCount: _routes.length,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: Text(
                  "Save",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
