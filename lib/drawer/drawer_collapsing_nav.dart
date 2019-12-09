import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/navigation_model.dart';

import 'collapsing_list_tile.dart';
import 'drawer_theme.dart';

class CollapsingNavDrawer extends StatefulWidget {

  @override
  _CollapsingNavDrawerState createState() => _CollapsingNavDrawerState();
}

class _CollapsingNavDrawerState extends State<CollapsingNavDrawer> with SingleTickerProviderStateMixin{

  double maxWidth = 300;
  double maxSize = 16;
  double minWidth = 92;
  double minSize = 0;
  int currentSelectedIndex = 0;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation, sizedBoxAnimation;
  String username= "John Doe";

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
    sizedBoxAnimation = Tween<double>(begin: maxSize, end: minSize).animate(_animationController);
  }

  getWidget(BuildContext context, Widget child){
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
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                children: <Widget>[
                  new Container(
                    width: 28,
                    height: 28,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: sizedBoxAnimation.value,),
                  widthAnimation.value >= 290 ? Text(username, style: defaultTextStyle,) : new Container(),
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
                    isSelected: currentSelectedIndex==counter,
                    onTap: (){
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                  );
                },
                itemCount: navItems.length,
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed ? _animationController.forward() : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.arrow_menu,
                color: Colors.blueGrey.shade800,
                size: 48, progress: _animationController,
              ),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController, builder: (BuildContext context, Widget child) => getWidget(context, child),
    );
  }
}
