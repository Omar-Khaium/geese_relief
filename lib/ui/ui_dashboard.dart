import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/collapsing_list_tile.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';
import 'package:flutter_grate_app/model/navigation_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_list.dart';
import 'package:flutter_grate_app/ui/fragment_logout.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

class DashboardUI extends StatefulWidget {
  Login login;

  DashboardUI(this.login);

  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI>
    with SingleTickerProviderStateMixin {
  double maxWidth = 300;
  double maxSize = 16;
  double minWidth = 92;
  double minSize = 0;
  int currentSelectedIndex = 0;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;
  String username = "John Doe";
  String fragmentTitle = "Dashboard";
  Widget fragment;

  @override
  void initState() {
    super.initState();
    fragment = updateFragment();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
    sizedBoxAnimation = Tween<double>(begin: maxSize, end: minSize)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget child) {
              return SafeArea(
                child: Container(
                  width: widthAnimation.value,
                  color: drawerBackgroundColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Row(
                          children: <Widget>[
                            new Container(
                              width: 28,
                              height: 28,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: sizedBoxAnimation.value,
                            ),
                            widthAnimation.value >= 290
                                ? Text(
                                    username,
                                    style: defaultTextStyle,
                                  )
                                : new Container(),
                          ],
                        ),
                      ),
                      new Divider(
                        thickness: 1,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, counter) {
                            return CollapsingListTile(
                              title: navItems[counter].title,
                              icon: navItems[counter].icon,
                              animationController: _animationController,
                              isSelected: currentSelectedIndex == counter,
                              onTap: () {
                                setState(() {
                                  currentSelectedIndex = counter;
                                  fragment = updateFragment();
                                });
                              },
                            );
                          },
                          itemCount: navItems.length,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCollapsed = !isCollapsed;
                            isCollapsed
                                ? _animationController.forward()
                                : _animationController.reverse();
                          });
                        },
                        child: AnimatedIcon(
                          icon: AnimatedIcons.arrow_menu,
                          color: Colors.blueGrey.shade800,
                          size: 48,
                          progress: _animationController,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: SafeArea(
              child: Container(
                color: Colors.grey.shade100,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                          child: Container(
                            margin: EdgeInsets.only(left: 32),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fragmentTitle,
                                style: fragmentTitleStyle(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height:
                                MediaQuery.of(context).size.height - 80 - 24,
                            child: fragment),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget updateFragment() {
    switch (currentSelectedIndex) {
      case 0:
        setState(() {
          fragmentTitle = "Dashboard";
        });
        return CustomerListFragment(widget.login);
      case 1:
        setState(() {
          fragmentTitle = "Add Customer";
        });
        return AddCustomerFragment();
      case 2:
        setState(() {
          fragmentTitle = "Change Password";
        });
        return ChangePasswordFragment();
      case 3:
        setState(() {
          fragmentTitle = "Logout";
        });
        return LogoutFragment();
    }
  }
}
