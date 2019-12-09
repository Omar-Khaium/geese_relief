import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class CollapsingListTile extends StatefulWidget {

  final String title;
  final IconData icon;
  final AnimationController animationController;
  final Function onTap;
  final bool isSelected;

  CollapsingListTile({@required this.title, @required this.icon, @required this.animationController, this.isSelected = false, this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {

  Animation<double> widthAnimation, sizedBoxAnimation;
  double maxWidth = 300;
  double maxSize = 16;
  double minWidth = 92;
  double minSize = 0;

  @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(begin: maxSize, end: minSize).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: widget.isSelected ? selectedMenuColor : Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: widget.isSelected ? selectedMenuColor : Colors.transparent,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: <Widget>[
            Icon(widget.icon, color: widget.isSelected? selectedColor : Colors.blueGrey.shade900.withOpacity(0.8), size: 28,),
            SizedBox(width: sizedBoxAnimation.value,),
            widthAnimation.value >= 290 ? Text(widget.title, style: widget.isSelected ? selectedTextStyle : defaultTextStyle,) : new Container(),
          ],
        ),
      ),
    );
  }
}
