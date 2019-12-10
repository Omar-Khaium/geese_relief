import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/collapsing_list_tile.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';
import 'package:flutter_grate_app/model/navigation_model.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_list.dart';
import 'package:flutter_grate_app/ui/fragment_logout.dart';

class DashboardUI extends StatefulWidget {
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
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;
  String username = "John Doe";
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
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFEBEBEB),
                child: fragment,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget updateFragment() {
    switch(currentSelectedIndex) {
      case 0:
        return CustomerListFragment();
      case 1:
        return AddCustomerFragment();
      case 2:
        return ChangePasswordFragment();
      case 3:
        return LogoutFragment();
    }
  }
}
