import 'package:flutter/material.dart';

class QuickMenuBadge extends StatelessWidget {
  final IconData icon;
  final int count;

  QuickMenuBadge({this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
              child: Icon(
            icon,
            color: Colors.grey.shade600,
            size: 36,
          )),
          Positioned(
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                minWidth: 36,
                maxWidth: 54,
              ),
              child: Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  formatCount(count),
                  style: Theme.of(context).textTheme.overline.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            right: 8,
            top: 8,
          ),
        ],
      ),
    );
  }

  String formatCount(int count) {
    if (count <= 999)
      return count.toString();
    else if (count > 999 && count < 999999)
      return "${(count / 1000).toStringAsFixed(2)}K";
    else if (count > 999999 && count < 999999999)
      return "${(count / 1000000).toStringAsFixed(2)}M";
    else if (count > 999999999 && count < 999999999999)
      return "${(count / 1000000000).toStringAsFixed(2)}B";
  }
}
