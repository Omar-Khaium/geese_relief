import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/organaization_model.dart';
import 'package:flutter_grate_app/sqflite/database_info.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/fragment_organization_list.dart';
import 'package:flutter_grate_app/ui/ui_dashboard.dart';
import 'package:flutter_grate_app/ui/ui_forgret_password.dart';
import 'package:flutter_grate_app/widgets/OrganizationList.dart';
import 'package:flutter_grate_app/widgets/customer_details_shimmer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../utils.dart';

class LogInUI extends StatefulWidget {
  Login login;

  LogInUI(this.login);

  @override
  _LogInUIState createState() => _LogInUIState();
}

class _LogInUIState extends State<LogInUI> {
  bool _isRemembered = false;
  bool _isLoading = false;
  bool _isObscureText = true;
  bool _usernameValidator = true;
  bool _passwordValidator = true;
  Color _usernameIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  List<Organization> _list = [];
  DBHelper dbHelper = new DBHelper();
  Login login;
  LoggedInUser loggedInUser;

  List<Organization> menus = [
    Organization(Icon(MdiIcons.bookMinus), "Portfolio"),
    Organization(Icon(MdiIcons.settings), "Service"),
    Organization(Icon(MdiIcons.bagPersonal), "Clients"),
    Organization(Icon(Icons.supervisor_account), "Our Team"),
    Organization(Icon(Icons.announcement), "Announcement"),
    Organization(Icon(Icons.rate_review), "Review"),
  ];

  saveToDatabase() async {
    Login log = await dbHelper.saveLogin(login);

    if (log == null) {
      setState(() {
        _isLoading = false;
      });

      showMessage(
          context,
          "Offline Database ERROR!",
          "Failed to save in offline-database.",
          Colors.redAccent,
          Icons.error_outline);
    } else {
      await getData(login);

      setState(() {
        _isLoading = false;
      });

       /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new DashboardUI(login, loggedInUser)
          )
      );*/
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new OrganizationListUi(login,loggedInUser)
          )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _isObscureText = true;
    if (widget.login != null && widget.login.isRemembered) {
      _usernameController.text = widget.login.username;
      _passwordController.text = widget.login.password;
      _isRemembered = widget.login.isRemembered;
    }
  }

  Future<String> makeRequest() async {
    Map data = {
      'username': '${_usernameController.text}',
      'password': '${_passwordController.text}',
      'grant_type': 'password'
    };
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    var url = 'https://api.gratecrm.com/token';
    try {
      http.post(url, body: data).then((response) {
        if (response.statusCode == 200) {
          Map map = json.decode(response.body);
          login.accessToken = map['token_type'] + " " + map['access_token'];
          login.validity = map['expires_in'];
          login.isAuthenticated = true;
          saveToDatabase();
          //showPopUp();

            /*showDialog<void>(
              context: context,
              barrierDismissible: true, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.white,
                    title: FutureBuilder(
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
                                width: 300,
                                height: 300,
                                color: Colors.white,
                                child: new ListView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                          height: 50,
                                          color: Colors.white,
                                          child: Table(
                                            children: [
                                              TableRow(children: [
                                                _list[index].image,
                                                Text(_list[index].text)
                                              ]),
                                            ],
                                          )),
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
                    ));
              },
            );*/


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
          setState(() {
            _isLoading = false;
          });
        }
      });
    } catch (error) {
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
        message: "Timeout!",
        shouldIconPulse: false,
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        child: new Stack(
          children: <Widget>[
            new Image.asset(
              "images/background.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  color: Colors.black.withOpacity(0),
                  child: Container(
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: new Row(
                children: <Widget>[
/*---------------------------------Left Image---------------------------------*/
                  new Expanded(
                    child: new Stack(
                      children: <Widget>[
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                              child: Image.asset(
                                'images/basement.jfif',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(
                              color: Colors.black.withOpacity(0),
                              child: Center(
                                child: Text(
                                  "Welcome To Grate App",
                                  style: customWelcomeStyle(Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    flex: 1,
                  ),

/*---------------------------------Login Form---------------------------------*/
                  new Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset("images/logo.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Login",
                                    style: customWelcomeStyle(
                                        Colors.blueGrey.shade800),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 36,
                            ),
                            new TextField(
                              controller: _usernameController,
                              obscureText: false,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              onTap: () {
                                setState(() {
                                  _passwordIconColor = Colors.grey;
                                  _usernameIconColor = Colors.black;
                                });
                              },
                              style: customTextStyle(),
                              decoration: new InputDecoration(
                                icon: new Icon(
                                  Icons.mail_outline,
                                  color: _usernameIconColor,
                                ),
                                errorText:
                                    _usernameValidator ? null : "* Required",
                                errorStyle: customTextFieldErrorStyle(),
                                labelText: "Username",
                                labelStyle: customTextStyle(),
                                hintText: "e.g. example@mail.com",
                                hintStyle: customHintStyle(),
                                alignLabelWithHint: false,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            new TextField(
                              controller: _passwordController,
                              obscureText: _isObscureText,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              onTap: () {
                                setState(() {
                                  _passwordIconColor = Colors.black;
                                  _usernameIconColor = Colors.grey;
                                });
                              },
                              style: customTextStyle(),
                              decoration: new InputDecoration(
                                icon: new Icon(
                                  Icons.lock_outline,
                                  color: _passwordIconColor,
                                ),
                                errorText:
                                    _passwordValidator ? null : "* Required",
                                errorStyle: customTextFieldErrorStyle(),
                                labelText: "Password",
                                labelStyle: customTextStyle(),
                                hintText: "e.g. ******",
                                hintStyle: customHintStyle(),
                                alignLabelWithHint: false,
                                suffixIcon: new IconButton(
                                  icon: _isObscureText
                                      ? new Icon(
                                          Icons.visibility,
                                          color: _passwordIconColor,
                                        )
                                      : new Icon(
                                          Icons.visibility_off,
                                          color: _passwordIconColor,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscureText =
                                          _isObscureText ? false : true;
                                    });
                                  },
                                  iconSize: 24,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            new Stack(
                              children: <Widget>[
                                Align(
                                  child: new Row(
                                    children: <Widget>[
                                      Checkbox(
                                        activeColor: Colors.black,
                                        checkColor: Colors.white,
                                        value: _isRemembered,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isRemembered = value;
                                          });
                                        },
                                      ),
                                      InkWell(
                                        child: new Text(
                                          "Remember Me",
                                          style: customTextStyle(),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _isRemembered = !_isRemembered;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                Align(
                                  child: MaterialButton(
                                    elevation: 4,
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(36.0),
                                      side: BorderSide(color: Colors.white12),
                                    ),
                                    textColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32,
                                          right: 32,
                                          top: 16,
                                          bottom: 16),
                                      child: new Text(
                                        "Login",
                                        style: customButtonTextStyle(),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _usernameValidator =
                                            _usernameController.text.isNotEmpty;
                                        _passwordValidator =
                                            _passwordController.text.isNotEmpty;

                                        if (_usernameValidator &&
                                            _passwordValidator) {
                                          _isLoading = true;
                                          login = new Login(
                                              null,
                                              _usernameController.text,
                                              _passwordController.text,
                                              _isRemembered,
                                              false,
                                              "",
                                              0);
                                          makeRequest();
                                        }
                                      });
                                    },
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                            Expanded(
                              child: new Container(
                                height: double.infinity,
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 16,
                                        right: 16,
                                        bottom: 16),
                                    child: new Text(
                                      "Forget Password",
                                      style: customInkWellTextStyle(),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  new ForgetPasswordUI()));
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),

/*------------------------------Loading Indicator-----------------------------*/
                ],
              ),
            ),
          ],
        ),
        inAsyncCall: _isLoading,
        color: Colors.black,
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        dismissible: false,
      ),
    );
  }

  getData(Login login) async {
    Map<String, String> headers = {
      'Authorization': login.accessToken,
      'username': login.username
    };

    var url = "https://api.gratecrm.com/GetUserByUserName";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      loggedInUser = LoggedInUser.fromMap(json.decode(result.body));
      await saveLoggedInUserToDatabase(loggedInUser);
      return loggedInUser;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return null;
    }
  }

  getOrganizationData() async {
    try{
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
    }
    catch(error){
      print(error);
    }

  }

  saveLoggedInUserToDatabase(LoggedInUser loggedInUser) async {
    await dbHelper.deleteAll(DBInfo.TABLE_CURRENT_USER);
    await dbHelper.save(loggedInUser, DBInfo.TABLE_CURRENT_USER);
  }

  void showPopUp() {
    try{
      showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              content : FutureBuilder(
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
                          width: 300,
                          height: 300,
                          color: Colors.white,
                          child: new ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: organizationMap.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                    height: 50,
                                    color: Colors.white,
                                    child: Table(
                                      children: [
                                        TableRow(children: [
                                          _list[index].image,
                                          Text(_list[index].text)
                                        ]),
                                      ],
                                    )),
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
              ));
        },
      );
    }
    catch(error){
      print(error);
    }
  }
}
