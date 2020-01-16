import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/organaization_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/ui_dashboard.dart';
import 'package:flutter_grate_app/widgets/customer_details_shimmer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class OrganizationListUi extends StatefulWidget {
  Login login;
  LoggedInUser loggedInUser;

  OrganizationListUi(this.login,this.loggedInUser);

  @override
  _OrganizationListUiState createState() => _OrganizationListUiState();
}

class _OrganizationListUiState extends State<OrganizationListUi> {
  List<Organization> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        title: Text("Please Slelect Organization"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getOrganizationData(),
          builder: (context, snapshot) {
        try {
          if (snapshot.hasData) {
            var map = json.decode(snapshot.data.body);
            var organizationMap = map['orglist'];
            if (organizationMap == null) {
              _list = [];
            } else {
              _list = List.generate(organizationMap.length, (index) {
                return Organization.fromMap(organizationMap[index]);
              });
            }
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
                  itemCount: organizationMap.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: map['orglist'][index]['selected'] ?Colors.lightBlue.shade50:Colors.transparent
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DashboardUI(widget.login,widget.loggedInUser)
                              )
                          );
                        },
                        leading: Icon(Icons.business),
                        title: Text(
                          _list[index].text,
                          style: new TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:
                              FontWeight.bold),
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
            return ShimmerCustomerDetailsFragment();
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
        print(map['orglist'][0]['text']);
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
}
