import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class RecommendedLevelLabel extends StatelessWidget {
  int _index;

  RecommendedLevelLabel(this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 8),
          child: Text("Level ${_index + 1}", style: defaultTextStyle,),
        ),
      ),
    );
  }
}
