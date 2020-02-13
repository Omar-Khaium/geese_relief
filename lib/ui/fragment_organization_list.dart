import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/organaization_model.dart';
import 'package:flutter_grate_app/sqflite/database_info.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/ui_dashboard.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_customer.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_with_only_icon.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_without_icon.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class OrganizationListUI extends StatefulWidget {
  final Login login;
  final LoggedInUser loggedInUser;

  OrganizationListUI(this.login, this.loggedInUser);

  @override
  _OrganizationListUIState createState() => _OrganizationListUIState();
}

class _OrganizationListUIState extends State<OrganizationListUI> {
  List<Organization> _list = [];

  String message;
  DBHelper dbHelper = new DBHelper();
  var _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getOrganizationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        leading: Container(),
        title: Text(
          "Please Select An Organization",
          style: new TextStyle(fontSize: 26, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            try {
              if (snapshot.hasData) {
                try {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: new ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                        thickness: .4,
                      ),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: _list[index].selected
                                  ? Colors.lightBlue.shade50
                                  : Colors.transparent),
                          child: ListTile(
                            onTap: () {
                              resetSelection(index);
                              showDialog(
                                  context: context,
                                  builder: (_) => loadingAlert());
                              saveOrganization(index, widget.login);
                            },
                            leading: Icon(Icons.business),
                            title: Text(
                              _list[index].text,
                              style: new TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } catch (error) {
                  return Center(
                    child: Text(
                      "Something went wrong...",
                      style: listTextStyle(),
                    ),
                  );
                }
              } else {
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [0, 1, 2, 3, 4, 5]
                          .map((_) => ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 16, top: 4, right: 4),
                                title: ShimmerItemCustomer(250),
                        subtitle: Divider(),
                              ))
                          .toList(),
                    )
                  ],
                );
              }
            } catch (error) {
              return Center(
                child: Text(
                  "Something went wrong...",
                  style: listTextStyle(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future getOrganizationData() async {
    try {
      Map<String, String> headers = {
        'Authorization': widget.login.accessToken,
      };
      var url = "https://api.gratecrm.com/GetOrganizationList";
      var result = await http.get(url, headers: headers);
      if (result.statusCode == 200) {
        Map map = json.decode(result.body);
        _list = List.generate(map['orglist'].length, (index) {
          return Organization.fromMap(map['orglist'][index]);
        });
        if (_list.length == 1) {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      new DashboardUI(widget.login, widget.loggedInUser)));
        }
        return result;
      } else {
        showMessage(context, "Network error!", json.decode(result.body),
            Colors.redAccent, Icons.warning);
        return {};
      }
    } catch (error) {
      print(error);
    }
  }

  saveOrganization(index, Login login) async {
    Map<String, String> headers = {
      'Authorization': login.accessToken,
      'Companyid': _list[index].value
    };

    var url = "https://api.gratecrm.com/ChangeDefaultCompany";
    var result = await http.post(url, headers: headers);
    try {
      if (result.statusCode == 200) {
        widget.loggedInUser.CompanyGUID = _list[index].value;
        widget.loggedInUser.CompanyName = _list[index].text;
        Navigator.of(context).pop();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    new DashboardUI(widget.login, widget.loggedInUser)));
      } else {
        showMessage(context, "Network error!", json.decode(result.body),
            Colors.redAccent, Icons.warning);
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  saveLoggedInUserToDatabase(LoggedInUser loggedInUser) async {
    await dbHelper.deleteAll(DBInfo.TABLE_CURRENT_USER);
    await dbHelper.save(loggedInUser, DBInfo.TABLE_CURRENT_USER);
  }

  resetSelection(index) async {
    for (Organization item in _list) {
      setState(() {
        item.selected = false;
      });
    }
    setState(() {
      _list[index].selected = true;
    });
  }

  showSaving() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            title: Container(
              width: 300,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.infinity,
                            color: Colors.black87,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "adwadwadw",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
