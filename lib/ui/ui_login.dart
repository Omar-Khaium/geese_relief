import 'package:flutter/material.dart';

import 'form_login.dart';

class LoginState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("Login", style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).primaryColor, Colors.blueGrey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(48),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
