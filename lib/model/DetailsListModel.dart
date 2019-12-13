import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailsList extends StatelessWidget{

  final String estimateId;
  final String estimateDate;
  final String estimateNumber;
  final String estimateAmount;

  DetailsList(this.estimateId, this.estimateDate, this.estimateNumber,this.estimateAmount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.viewGrid),
                        Text(estimateId,style: new TextStyle(fontSize: 20,color: Colors.black26),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text(estimateDate,style: new TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.pound),
                        Text(estimateNumber,style: new TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        Text(estimateAmount,style: new TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }




}