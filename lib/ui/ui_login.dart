import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/database_info.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/fragment_organization_list.dart';
import 'package:flutter_grate_app/ui/ui_forgret_password.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:flutter_grate_app/widgets/widget_dark_background.dart';
import 'package:flutter_grate_app/widgets/widget_image_background.dart';
import 'package:flutter_grate_app/widgets/widget_left_image.dart';
import 'package:flutter_grate_app/widgets/widget_text.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class LogInUI extends StatefulWidget {
  Login login;

  LogInUI(this.login);

  @override
  _LogInUIState createState() => _LogInUIState();
}

class _LogInUIState extends State<LogInUI> {
  bool _isRemembered = false;
  bool _isObscureText = true;
  var _key = new GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  DBHelper dbHelper = new DBHelper();
  Login login;
  LoggedInUser loggedInUser;

  saveToDatabase() async {
    Login log = await dbHelper.saveLogin(login);

    if (log == null) {
      Navigator.of(context).pop();

      showMessage(
          context,
          "Offline Database ERROR!",
          "Failed to save in offline-database.",
          Colors.redAccent,
          Icons.error_outline);
    } else {
      await getData(login);

      Navigator.of(context).pop();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  new OrganizationListUi(login, loggedInUser)));
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: new Stack(
        children: <Widget>[
          DarkBackgroundWidget(),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: LeftPanelForLoginWidget(),
                  flex: 1,
                ),
                new Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Form(
                        key: _key,
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
                            new TextFormField(
                              controller: _usernameController,
                              obscureText: false,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              validator: (val) {
                                return val.isNotEmpty ? null : "* Required";
                              },
                              style: customTextStyle(),
                              decoration: new InputDecoration(
                                isDense: true,
                                icon: new Icon(
                                  Icons.mail_outline,
                                ),
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
                            new TextFormField(
                              controller: _passwordController,
                              obscureText: _isObscureText,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              validator: (val) {
                                return val.isNotEmpty ? null : "* Required";
                              },
                              style: customTextStyle(),
                              decoration: new InputDecoration(
                                isDense: true,
                                icon: new Icon(
                                  Icons.lock_outline,
                                ),
                                labelText: "Password",
                                labelStyle: customTextStyle(),
                                hintText: "e.g. ******",
                                hintStyle: customHintStyle(),
                                alignLabelWithHint: false,
                                suffixIcon: new IconButton(
                                  icon: _isObscureText
                                      ? new Icon(
                                          Icons.visibility,
                                        )
                                      : new Icon(
                                          Icons.visibility_off,
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
                                        child: TextWidget(
                                          "Remember Me",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
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
                                      child: TextWidget(
                                        "Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .title
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_key.currentState.validate()) {
                                          showDialog(
                                              context: context,
                                              builder: (_) => loadingAlert());
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
                                    child: TextWidget(
                                      "Forget Password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subhead
                                          .copyWith(color: Colors.black),
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
                  ),
                  flex: 1,
                ),

/*------------------------------Loading Indicator-----------------------------*/
              ],
            ),
          ),
        ],
      ),
    );
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
          Navigator.of(context).pop();
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

  saveLoggedInUserToDatabase(LoggedInUser loggedInUser) async {
    await dbHelper.deleteAll(DBInfo.TABLE_CURRENT_USER);
    await dbHelper.save(loggedInUser, DBInfo.TABLE_CURRENT_USER);
  }
}
