import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/ui_dashboard.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';

class LauncherUI extends StatefulWidget {
  @override
  _LauncherUIState createState() => _LauncherUIState();
}

class _LauncherUIState extends State<LauncherUI> {
  DBHelper dbHelper = new DBHelper();
  Future<Login> fromDBLogin;
  Login login;

  begin() {
    fromDBLogin = dbHelper.getAllFromLogin();
    fromDBLogin.then((result) {
      login = result;
      if (login != null) {
        setState(() {
          if (login.isAuthenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new DashboardUI(login),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new LogInUI(login),
              ),
            );
          }
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new LogInUI(login),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    begin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 144,
              height: 144,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 36,
            ),
            CupertinoActivityIndicator(
              animating: true,
              radius: 14,
            )
          ],
        ),
      ),
    );
  }
}
