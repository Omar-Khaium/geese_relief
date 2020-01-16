import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/organaization_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/OrganizationList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class Demo extends StatefulWidget {

  Login login;

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {


  List<Organization> menus = [
    Organization(Icon(MdiIcons.bookMinus),"Portfolio"),
    Organization(Icon(MdiIcons.settings),"Service"),
    Organization(Icon(MdiIcons.bagPersonal),"Clients"),
    Organization(Icon(Icons.supervisor_account),"Our Team"),
    Organization(Icon(Icons.announcement),"Announcement"),
    Organization(Icon(Icons.rate_review),"Review"),
  ];

  @override
  Widget build(BuildContext context) {

    return Center(
      child: RaisedButton(
          onPressed: (){
          showPopUp();
        },
        child: Text("Check"),
      ),
    );
  }


  void showPopUp() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title:
          Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: menus.length,
            itemBuilder: (BuildContext context,index){
              return QuickMenu(
                  menus[index].image,
                  menus[index].text
              );
            },),
          )

        );
      },
    );
  }


}
