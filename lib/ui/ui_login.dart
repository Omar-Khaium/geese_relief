import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isRemembered = false;
  bool _username_validator = true;
  bool _password_validator = true;
  Color _usernameIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  TextEditingController _username_controller = new TextEditingController();
  TextEditingController _password_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          new Image.asset(
            "images/background.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
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
                          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                          child: Container(
                            color: Colors.black.withOpacity(0),
                            child: Image.asset(
                              'images/basement.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
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
                                  style: customWelcomeStyle(Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          new TextField(
                            controller: _username_controller,
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
                              errorText: _username_validator ? null : "* Required",
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
                            controller: _password_controller,
                            obscureText: true,
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
                              errorText: _password_validator ? null : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Password",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. ******",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
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
                                      _username_validator = _username_controller.text.isNotEmpty;
                                      _password_validator = _password_controller.text.isNotEmpty;
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
                                child: new Text(
                                  "Forget Password",
                                  style: customInkWellTextStyle(),
                                ),
                                onTap: () {
                                  setState(() {});
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
