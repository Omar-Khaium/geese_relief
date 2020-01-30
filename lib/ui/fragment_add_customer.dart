import 'dart:async';
import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grate_app/model/dropdown_item.dart';
import 'package:flutter_grate_app/model/product.dart';
import 'package:flutter_grate_app/model/zip_model.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';
import 'package:flutter_grate_app/widgets/UsFormatter.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils.dart';

class AddCustomerFragment extends StatefulWidget {
  ValueChanged<int> backToDashboard;
  Login login;
  ValueChanged<bool> isLoading;
  LoggedInUser loggedInUser;

  AddCustomerFragment(
      {Key key,
      this.backToDashboard,
      this.login,
      this.loggedInUser,
      this.isLoading})
      : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomerFragment> {
  DBHelper dbHelper = new DBHelper();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Zip zipDatas;

  @override
  void initState() {
    super.initState();
    _future = getData();
    if (!widget.login.isAuthenticated) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LogInUI(widget.login)));
    }
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

  List<DropDownSingleItem> TypeArray = [];
  int TypeDropdown = 0;

  static String ACCESS_TOKEN = "";
  var _future;
  Product selectedProduct;
  final _UsNumberTextInputFormatter = UsNumberTextInputFormatter();

  // ignore: missing_return
  Future<String> makeRequest() async {
    widget.isLoading(true);
    try {
      Map<String, String> data = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization': widget.login.accessToken,
        'FirstName': '${_firstNameController.text}',
        'LastName': '${_lastNameController.text}',
        'BusinessName': '${_businessTypeController.text}',
        'Type': TypeArray[TypeDropdown].DataValue,
        'PrimaryPhone': '${_primaryPhoneController.text}',
        'SecondaryPhone': '${_secondaryPhoneController.text}',
        'CellNo': '${_cellPhoneController.text}',
        'email': '${_emailController.text}',
        'Street': '${_streetController.text}',
        'City': '${_cityController.text}',
        'State': '${_stateController.text}',
        'ZipCode': '${_zipController.text}',
        'IsLead': 'false',
        "LeadSource": "-1",
        "Id": "0",
      };
      http.post(BASE_URL + API_SAVE_CUSTOMER, headers: data).then((response) {
        widget.isLoading(false);
        if (response.statusCode == 200) {
          Map map = json.decode(response.body);
          showMessage(context, "Success!", "Customer Added Successfully",
              Colors.green.shade600, null);
          widget.backToDashboard(0);
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
            title: response.toString(),
            message: "",
            shouldIconPulse: false,
          )..show(context);
          widget.login.isAuthenticated = false;
        }
      });
    } catch (error) {
      error.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                      Text("Add Customer", style: fragmentTitleStyle()),
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
                child: Container(
                  margin: EdgeInsets.only(right: 32, left: 32),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _firstNameController,
                                style: customTextStyle(),
                                cursorColor: Colors.black87,
                                autofocus: false,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration: new InputDecoration(
                                  labelText: "First Name",
                                  errorText:
                                      _firstNameController.text.isNotEmpty
                                          ? null
                                          : "* Required",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  icon: new Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
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
                              child: TextFormField(
                                cursorColor: Colors.black87,
                                keyboardType: TextInputType.text,
                                controller: _lastNameController,
                                maxLines: 1,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                style: customTextStyle(),
                                decoration: new InputDecoration(
                                  labelText: "Last Name",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  icon: new Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  errorText: _lastNameController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                                  hintStyle: customHintStyle(),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          style: customTextStyle(),
                          controller: _businessTypeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          autofocus: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          decoration: new InputDecoration(
                            labelText: "Business Name",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            icon: new Icon(
                              Icons.business,
                              color: Colors.grey,
                            ),
                            isDense: true,
                            errorText: _businessTypeController.text.isNotEmpty
                                ? null
                                : "* Required",
                            hintStyle: customHintStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownButtonFormField(
                          isDense: true,
                          decoration: new InputDecoration(
                              errorText: TypeDropdown == 0
                                  ? "Select another value"
                                  : null,
                              labelText: "Business Type",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(TypeArray.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(TypeArray[index].DisplayText));
                          }),
                          onChanged: (index) {
                            setState(() {
                              TypeDropdown = index;
                            });
                          },
                          value: TypeDropdown,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _primaryPhoneController,
                                style: customTextStyle(),
                                onChanged: (val) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black87,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                autofocus: false,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  _UsNumberTextInputFormatter,
                                ],
                                decoration: new InputDecoration(
                                  labelText: "Primary Phone",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  icon: new Icon(
                                    Icons.call,
                                    color: Colors.grey,
                                  ),
                                  errorText:
                                      _primaryPhoneController.text.isNotEmpty
                                          ? null
                                          : "* Required",
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
                              child: TextFormField(
                                cursorColor: Colors.black87,
                                controller: _secondaryPhoneController,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                style: customTextStyle(),
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  _UsNumberTextInputFormatter,
                                ],
                                decoration: new InputDecoration(
                                  labelText: "Secondary Phone",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  icon: new Icon(
                                    Icons.call,
                                    color: Colors.grey,
                                  ),
                                  errorText:
                                      _secondaryPhoneController.text.isNotEmpty
                                          ? null
                                          : "* Required",
                                  hintStyle: customHintStyle(),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          style: customTextStyle(),
                          controller: _cellPhoneController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          autofocus: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                            _UsNumberTextInputFormatter,
                          ],
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
                            errorText: _cellPhoneController.text.isNotEmpty
                                ? null
                                : "* Required",
                            hintStyle: customHintStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          style: customTextStyle(),
                          controller: _emailController,
                          autofocus: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
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
                            errorText: _emailController.text.isNotEmpty
                                ? null
                                : "* Required",
                            hintStyle: customHintStyle(),
                            isDense: true,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          style: customTextStyle(),
                          controller: _streetController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          onChanged: (val) {
                            setState(() {});
                          },
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
                            errorText: _streetController.text.isNotEmpty
                                ? null
                                : "* Required",
                            hintStyle: customHintStyle(),
                            isDense: true,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.black87,
                          style: customTextStyle(),
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          onChanged: (val) {
                            setState(() {});
                          },
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
                            errorText: _cityController.text.isNotEmpty
                                ? null
                                : "* Required",
                            hintStyle: customHintStyle(),
                            isDense: true,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                style: customTextStyle(),
                                cursorColor: Colors.black87,
                                controller: _stateController,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                maxLines: 1,
                                decoration: new InputDecoration(
                                  labelText: "State",
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  icon: new Icon(
                                    MdiIcons.homeCity,
                                    color: Colors.grey,
                                  ),
                                  errorText: _stateController.text.isNotEmpty
                                      ? null
                                      : "* Required",
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
                              child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: _zipController,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                    decoration: new InputDecoration(
                                      labelText: "Zip",
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black87)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      icon: new Icon(
                                        MdiIcons.zipBox,
                                        color: Colors.grey,
                                      ),
                                      hintStyle: customHintStyle(),
                                      errorText: _stateController.text.isNotEmpty
                                          ? null
                                          : "* Required",
                                      isDense: true,
                                    )),
                                suggestionsCallback: (pattern) async {

                                  return _zipController.text.length>=3 ? await getZipData(pattern):Container();
                                },
                                itemBuilder: (context, suggestion) {
                                  Zip zip = suggestion;
                                  return ListTile(
                                    leading: Icon(MdiIcons.zipBoxOutline),
                                    title: Text(zip.zipCode),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Text(zip.city + ","),
                                        Text(zip.state),
                                      ],
                                    ),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  zipDatas = suggestion;

                                    setState(() {
                                      _zipController.text = zipDatas.zipCode;
                                      _cityController.text = zipDatas.city;
                                      _stateController.text = zipDatas.state;
                                    });


                                },
                                hideSuggestionsOnKeyboardHide: true,
                                hideOnError: true,
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
                              highlightElevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(36.0),
                                  side: BorderSide(color: Colors.white12)),
                              disabledColor: Colors.black,
                              color: Colors.black,
                              elevation: 2,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Submit",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Roboto"),
                              ),
                              onPressed: () {
                                if (_firstNameController.text.isNotEmpty &&
                                    _secondaryPhoneController.text.isNotEmpty &&
                                    _businessTypeController.text.isNotEmpty &&
                                    _primaryPhoneController.text.isNotEmpty &&
                                    _secondaryPhoneController.text.isNotEmpty &&
                                    _cellPhoneController.text.isNotEmpty &&
                                    _emailController.text.isNotEmpty &&
                                    _streetController.text.isNotEmpty &&
                                    _cityController.text.isNotEmpty &&
                                    _stateController.text.isNotEmpty &&
                                    _zipController.text.isNotEmpty) {
                                  makeRequest();
                                } else {
                                  showMessage(
                                      context,
                                      "Validation Error",
                                      "Please fill all the fields",
                                      Colors.red,
                                      Icons.error);
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
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
                      Text("Add Customer", style: fragmentTitleStyle()),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                ),
                margin: EdgeInsets.only(left: 32, right: 32),
              ),
            ],
          );
        }
      },
    );
  }

  Future getData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'Key': 'CustomerType'
    };
    var result = await http.get(BASE_URL + API_GET_LOOK_UP, headers: headers);
    if (result.statusCode == 200) {
      var map = json.decode(result.body)['data'];
      List<DropDownSingleItem> lists = List.generate(map.length, (index) {
        return DropDownSingleItem.fromMap(map[index]);
      });
      for (DropDownSingleItem item in lists) {
        switch (item.DataKey) {
          case 'CustomerType':
            TypeArray.add(item);
            break;
        }
      }
      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }

  Future getZipData(String pattern) async {
    if (pattern.isNotEmpty) {
      Map<String, String> headers = {
        'key': _zipController.text,
        'appname': "GrateApp",
      };

      var result = await http.get(
          "http://zipcodelookup.rmrcloud.com/1.0/GetCityZipCodeLookupList",
          headers: headers);
      if (result.statusCode == 200) {
        try {
          var map = json.decode(result.body);
          List<Zip> _zipList = List.generate(map.length, (index) {
            return Zip.fromMap(map[index]);
          });
          return _zipList;
        } catch (error) {
          return [];
        }
      } else {
        showMessage(context, "Network error!", json.decode(result.body),
            Colors.redAccent, Icons.warning);
        return [];
      }
    }
  }
}
