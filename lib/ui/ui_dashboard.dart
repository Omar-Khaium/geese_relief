import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/collapsing_list_tile.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';
import 'package:flutter_grate_app/model/navigation_model.dart';
import 'package:flutter_grate_app/sqflite/database_info.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_list.dart';
import 'package:flutter_grate_app/ui/ui_login.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  int lastSelectedIndex = 0;
  bool isCollapsed = false;
  bool _isLoading = false;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;
  String username = "John Doe";
  String fragmentTitle = "Dashboard";
  Widget fragment;
  Widget lastFragment;
  DBHelper dbHelper = new DBHelper();

  saveToDatabase() async {
    Login log = await dbHelper.update(widget.login, DBInfo.TABLE_LOGIN);

    setState(() {
      if (log == null) {
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
          title: "Offline Database ERROR!",
          message: "Failed to save in offline-database.",
          shouldIconPulse: false,
        )..show(context);
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new LogInUI(widget.login)));
      }
      _isLoading = false;
    });
  }

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
      backgroundColor: Colors.grey.shade200,
      body: ModalProgressHUD(
        child: Row(
          children: <Widget>[
            SafeArea(
              child: Material(
                elevation: 4,
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
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
                                      lastSelectedIndex = currentSelectedIndex;
                                      currentSelectedIndex = counter;
                                      lastFragment = fragment;
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
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        fragmentTitle=="Logout" ? Container() : SizedBox(
                          height: 80,
                          child: Container(
                            margin: EdgeInsets.only(left: 32),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    fragmentTitle != "Dashboard"
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                switch (fragmentTitle) {
                                                  case "Add Customer":
                                                    currentSelectedIndex = 0;
                                                    break;
                                                  case "Change Password":
                                                    currentSelectedIndex = 0;
                                                    break;
                                                  case "Logout":
                                                    currentSelectedIndex = 0;
                                                    break;
                                                }
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 16),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.black,
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.arrow_back,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    Text(
                                      fragmentTitle,
                                      style: fragmentTitleStyle(),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height - 80 - 24,
                            child: fragment),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        inAsyncCall: _isLoading,
        color: Colors.black,
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white,),
        ),
        dismissible: false,
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
        return logoutWidget();
    }
  }

  Widget logoutWidget(){
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            spreadRadius: 16,
            offset: Offset(
              0,
              0,
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(top: 80),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("images/sign_out.png"),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Text(
              "Are you sure?",
              style: fragmentTitleStyle(),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentSelectedIndex = lastSelectedIndex;
                      fragment = updateFragment();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(
                            0,
                            0,
                          ),
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, top: 16, bottom: 16),
                        child: Text(
                          "Cancel",
                          style: defaultTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                      widget.login.isAuthenticated = false;
                      saveToDatabase();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade800,
                      borderRadius:
                      BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.shade100,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(
                            0,
                            0,
                          ),
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, top: 16, bottom: 16),
                        child: Text(
                          "Logout",
                          style: selectedTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
