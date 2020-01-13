import 'package:flutter/material.dart';

class RecommendedLevel5 extends StatefulWidget {
  @override
  _RecommendedLevel5State createState() => _RecommendedLevel5State();
}

class _RecommendedLevel5State extends State<RecommendedLevel5> {
  @override
  Widget build(BuildContext context) {
    return Banner(
      message: "Level 5",
      location: BannerLocation.topEnd,
      color: Colors.black,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xFF8E7148),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF8E7148),
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                children: <Widget>[
                  Text(
                    "Moisture Control",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "Closed Sump System",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "Grate Sump Liner",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "FastSump Liner (1)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "Grate Sump Liner (Empty)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "GS Joiner / Orange Cap",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "Pump Geek™",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "Radon Test Kit (Dual Vial)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.fiber_manual_record, color: Colors.white, size: 16,),
              title: Wrap(
                children: <Widget>[
                  Text(
                    "One Year Maintenance",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
