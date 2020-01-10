import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/widget_recommended_level_label.dart';

class RecommendedLevelCard extends StatefulWidget {
  @override
  _RecommendedLevelCardState createState() => _RecommendedLevelCardState();
}

class _RecommendedLevelCardState extends State<RecommendedLevelCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: MediaQuery.of(context).size.height*.8,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.shade100,
                blurRadius: 16,
                spreadRadius: 16,
                offset: Offset(
                  0,
                  0,
                ),
              )
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 24,
                bottom: MediaQuery.of(context).size.height*.8 - 64,
                right: 0,
                left: 272,
                child: RecommendedLevelLabel(0),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  color: Colors.white10,
                  onPressed: (){},

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
