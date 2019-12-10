import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddCustomerFragment extends StatefulWidget {
  @override
  _addContact createState() => _addContact();
}

class _addContact extends State<AddCustomerFragment> {

  DBHelper dbHelper = new DBHelper();
  Future<Login> fromDBLogin;
  Login login;
  begin() {
    fromDBLogin = dbHelper.getAllFromLogin();
    fromDBLogin.then((result) {
      login = result;
      if (login != null) {
        setState(() {
          if (!login.isAuthenticated) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new LoginUI()));
          }
        });
      }
    });
  }
  @override
  void initState() {
    super.initState();
    begin();
  }

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _businessTypeController = new TextEditingController();
  TextEditingController _primaryPhoneController = new TextEditingController();
  TextEditingController _secondaryPhoneController = new TextEditingController();
  TextEditingController _cellPhoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _streetController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _zipController = new TextEditingController();

  var items=['Type','One','Two','Three'];
  var currentItemSelected='Type';
  var url = 'http://api.rmrcloud.com/SaveCustomer';

  static String ACCESS_TOKEN="";
  // ignore: missing_return
  Future<String> makeRequest() async {
    Map data = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'authorization': 'bearer '+login.accessToken,
      'FirstName': '${_firstNameController.text}',
      'LastName': '${_lastNameController.text}',
      'BusinessName': '${_businessTypeController.text}',
      'Type': 'Test',
      'PrimaryPhone': '${_primaryPhoneController.text}',
      'SecondaryPhone': '${_secondaryPhoneController.text}',
      'CellNo': '${_cellPhoneController.text}',
      'email': '${_emailController.text}',
      'Street': '${_streetController.text}',
      'City': '${_cityController.text}',
      'State': '${_stateController.text}',
      'ZipCode': '${_zipController.text}',
      'CompanyId': 'B32817BB-B35D-44DC-9C12-ACC4D0D8A34C',
    };
    http.post(url, headers: data).then((response) {
      if (response.statusCode == 200) {
        Map map = json.decode(response.body);

      } else {
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.GROUNDED,
          backgroundColor: Colors.redAccent,
          icon: Icon(
            Icons.error_outline,
            size: 24.0,
            color: Colors.white,
          ),
          duration: Duration(seconds: 4),
          leftBarIndicatorColor: Colors.white70,
          boxShadows: [
            BoxShadow(
              color: Colors.red[800],
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            )
          ],
          title: "Authentication Error!",
          message: "Check your \'Username\' and \'Password\' again.",
          shouldIconPulse: false,
        )..show(context);
        login.isAuthenticated = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          padding: EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _firstNameController,
                      style: customTextStyle(),
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "First Name",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        errorText: _firstNameController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.text,
                      controller: _lastNameController,
                      maxLines: 1,
                      style: customTextStyle(),
                      decoration: new InputDecoration(
                        labelText: "Last Name",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        errorText: _lastNameController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                style: customTextStyle(),
                controller: _businessTypeController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Business Type",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.business,
                    color: Colors.grey,
                  ),
                  isDense: true,
                  errorText: _businessTypeController != null ? null : "* Required",
                  errorStyle: customTextFieldErrorStyle(),
                  hintStyle: customHintStyle(),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              DropdownButton<String>(
                hint: Text("Type"),
                items: items.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem ,
                    child: Text(dropDownStringItem),
                  );

                }).toList(),
                onChanged: (String ValueSelected){
                  setState(() {
                    this.currentItemSelected=ValueSelected;
                  });
                },
                value: currentItemSelected,

              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _primaryPhoneController,
                      style: customTextStyle(),
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "Primary Phone",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        errorText: _primaryPhoneController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      style: customTextStyle(),
                      decoration: new InputDecoration(
                        labelText: "Secondary Phone",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        errorText: _secondaryPhoneController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                style: customTextStyle(),
                controller: _cellPhoneController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Cell Phone",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  isDense: true,
                  errorText: _cellPhoneController != null ? null : "* Required",
                  errorStyle: customTextFieldErrorStyle(),
                  hintStyle: customHintStyle(),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                style: customTextStyle(),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Email",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  errorText: _emailController != null ? null : "* Required",
                  errorStyle: customTextFieldErrorStyle(),
                  hintStyle: customHintStyle(),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                style: customTextStyle(),
                controller: _streetController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Street",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    MdiIcons.road,
                    color: Colors.grey,
                  ),
                  errorText: _streetController != null ? null : "* Required",
                  errorStyle: customTextFieldErrorStyle(),
                  hintStyle: customHintStyle(),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                style: customTextStyle(),
                controller: _cityController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "City",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                  errorText: _cityController != null ? null : "* Required",
                  errorStyle: customTextFieldErrorStyle(),
                  hintStyle: customHintStyle(),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      style: customTextStyle(),
                      cursorColor: Colors.black87,
                      controller: _stateController,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "State",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          MdiIcons.homeCity,
                          color: Colors.grey,
                        ),
                        errorText: _stateController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      style: customTextStyle(),
                      controller: _zipController,
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "Zip",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          MdiIcons.zipBox,
                          color: Colors.grey,
                        ),
                        errorText: _zipController != null ? null : "* Required",
                        errorStyle: customTextFieldErrorStyle(),
                        hintStyle: customHintStyle(),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 36),
                  height: 64,
                  width: 156,
                  child: RaisedButton(
                    highlightElevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(36.0),
                        side: BorderSide(color: Colors.white12)),
                    disabledColor: Colors.black,
                    color: Colors.black,
                    elevation: 5,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Submit",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Roboto"),
                    ),
                    onPressed: (){
                      makeRequest();
                    },
                  ),
                ),
              )

            ],
          )),
    );
  }
}
