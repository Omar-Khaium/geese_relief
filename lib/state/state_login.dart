import 'package:flutter/material.dart';

import 'form_login.dart';

class LoginState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(top: true, left: true, right: true, bottom: true,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade700,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text("Login", style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade200],
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
      ),
    );
  }
}
