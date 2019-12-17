import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerDetailsFragment extends StatefulWidget {
  Login login;
  int customerID;
  ValueChanged<int> backToDashboard;
  ValueChanged<bool> showLoading;

  CustomerDetailsFragment(
      {Key key,
      this.login,
      this.customerID,
      this.backToDashboard,
      this.showLoading})
      : super(key: key);

  @override
  _CustomerDetailsFragmentState createState() =>
      _CustomerDetailsFragmentState();
}

class _CustomerDetailsFragmentState extends State<CustomerDetailsFragment> {
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 32),
            child: Row(
              children: <Widget>[
                CustomBackButton(
                  onTap: () => widget.backToDashboard(0),
                ),
                SizedBox(
                  width: 16,
                ),
                Text("Customer Details", style: fragmentTitleStyle()),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          child: Divider(),
          margin: EdgeInsets.only(left: 32, right: 32),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 32, right: 32),
                    child: Material(
                      elevation: 4,
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 48, right: 48),
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(12)),
                              child: Image.network(
                                  "https://i.ytimg.com/vi/g3t6YDnGXAc/hqdefault.jpg",
                                  width: 100,
                                  height: 100,
                                  scale: 1,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Dave Watson",
                                  style: new TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.email),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "piistech@gmail.com",
                                      style: new TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.call),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("537-55-9665",
                                        style: new TextStyle(fontSize: 16)),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("Camden,OH 45311 \nAtlanta, GA 30303",
                                        style: new TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 8,
                                  onPressed: () {},
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            MdiIcons.plus,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Add Basement Report",
                                            style: customButtonTextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 8,
                                  onPressed: () {},
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.looks_6,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Recommended Level",
                                            style: customButtonTextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 8,
                                  onPressed: () {},
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.pie_chart,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Add Estimate",
                                            style: customButtonTextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container();
                },
                itemCount: list.length,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
