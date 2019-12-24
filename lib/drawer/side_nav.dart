import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/navigation_model.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

import 'collapsing_list_tile.dart';
import 'drawer_theme.dart';

class SideNavUI extends StatefulWidget {
  final ValueChanged<int> refreshEvent;
  final Login login;
  final LoggedInUser loggedInUser;

  const SideNavUI({Key key, this.refreshEvent, this.login, this.loggedInUser})
      : super(key: key);

  @override
  SideNavUIState createState() => SideNavUIState();
}

class SideNavUIState extends State<SideNavUI>
    with SingleTickerProviderStateMixin {
  double maxWidth = 300;
  double maxSize = 16;
  double minWidth = 92;
  double minSize = 0;
  int currentSelectedIndex = 0;
  int lastSelectedIndex = 0;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;
  String fragmentTitle = "Dashboard";
  Widget fragment;
  Widget lastFragment;
  DBHelper dbHelper = new DBHelper();

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
    sizedBoxAnimation = Tween<double>(begin: maxSize, end: minSize)
        .animate(_animationController);
  }

  updateSelection(int selection) {
    setState(() {
      currentSelectedIndex = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: widthAnimation.value,
            color: drawerBackgroundColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.lightBlue.shade50,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlue.shade50,
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(
                          0,
                          0,
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      widget.loggedInUser.ProfilePicture == null ||
                              widget.loggedInUser.ProfilePicture.isEmpty
                          ? CircleAvatar(
                              maxRadius: 14,
                              minRadius: 14,
                              backgroundColor: Colors.black,
                              child: Text(
                                widget.loggedInUser.UserName
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: customButtonTextStyle(),
                              ),
                            )
                          : new Container(
                              width: 28,
                              height: 28,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      widget.loggedInUser.ProfilePicture),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: sizedBoxAnimation.value,
                      ),
                      widthAnimation.value >= 290
                          ? Text(
                              widget.loggedInUser.UserName,
                              style: defaultTextStyle,
                              overflow: TextOverflow.ellipsis,
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
                            widget.refreshEvent(currentSelectedIndex);
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
          );
        },
      ),
    );
  }
}