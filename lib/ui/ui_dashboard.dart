import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/Add%20Contact.dart';
import 'package:flutter_grate_app/widgets/ChangePassword.dart';
import 'package:flutter_grate_app/widgets/DashboardPage.dart';
import 'package:flutter_grate_app/widgets/TitleText.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {

  Widget DashboardWidget;
  String text="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DashboardWidget=new Container();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    bool pressed = true;

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: <Widget>[
                                      Image.asset(
                                        'images/logo.png',
                                        height: 36,
                                        width: 36,
                                        scale: 1,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text(
                                              "Grate App",
                                              style: new TextStyle(
                                                  fontFamily: "Monserrat",
                                                  color: Colors.black,
                                                  fontSize: 24),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              new Container(
                                alignment: Alignment.center,
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.black,
                                margin: const EdgeInsets.only(
                                    top: 8, left: 24, right: 24),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 36),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 36,
                                    ),

                                    //-------Button------
                                    OutlineButton(
                                        onPressed: (){
                                          setState(() {
                                            DashboardWidget=DashboardPageWidget();
                                            text="Dashboard";
                                          });
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(Icons.home)),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 48.0),
                                                  child: Text(
                                                    "Dashboard",
                                                    style: new TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: "Roboto"),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        color: Colors.green,
                                        borderSide: new BorderSide(
                                            color: Colors.white70),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(5.0))),
                                    SizedBox(height: 24),

                                    //-------Button------
                                    OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            DashboardWidget=AddContact();
                                          }
                                          );
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(Icons.group_add)),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 48.0),
                                                  child: Text(
                                                    "Add Contact",
                                                    style: new TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: "Roboto"),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        borderSide: new BorderSide(
                                            color: Colors.white70),
                                        color: pressed ? Colors.white : Colors
                                            .green,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                10.0))),
                                    SizedBox(height: 24),

                                    //-------Button------
                                    OutlineButton(
                                        onPressed: () {
                                          setState(() {
                                            DashboardWidget=ChangePassword();
                                            text="Change Password";
                                          });
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(Icons.replay)),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 48.0),
                                                  child: Text(
                                                    "Change Password",
                                                    style: new TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: "Roboto"),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        color: Colors.green,
                                        highlightColor: Colors.red,
                                        borderSide: new BorderSide(
                                            color: Colors.white70),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                5.0))),
                                    SizedBox(height: 24),

                                    //-------Button------
                                    OutlineButton(
                                        onPressed: () => null,
                                        child: Stack(
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(MdiIcons.logout)),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 48.0),
                                                  child: Text(
                                                    "Logout",
                                                    style: new TextStyle(
                                                        fontSize: 22,
                                                        fontFamily: "Roboto"),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ))
                                          ],
                                        ),
                                        color: Colors.green,
                                        borderSide: new BorderSide(
                                            color: Colors.white70),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                5.0))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              new Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://i.imgur.com/BoN9kdC.png")))),
                              SizedBox(
                                height: 36,
                              ),
                              Text(
                                "Central Station Marketing",
                                style: new TextStyle(
                                    fontFamily: "Roboto", fontSize: 18),
                              ),
                              SizedBox(
                                height: 86,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Welcome,Tanvir",
                                  style: new TextStyle(
                                      fontFamily: "Roboto", fontSize: 18),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 36,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TitleText(text),
                              ],
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: DashboardWidget,
                            )
                          ],
                        )
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}