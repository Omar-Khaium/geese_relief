import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/model/customer.dart';

class CustomerDetailsCard extends StatefulWidget {
  Customer customer;
  CustomerDetailsCard(this.customer);


  @override
  _customerDetailsCardState createState() => _customerDetailsCardState();
}

class _customerDetailsCardState extends State<CustomerDetailsCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          top: 10,
          left: 16,
          right: 16,
          child: Card(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                height: 310,
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: new BorderRadius.all(Radius.circular(12)),
                        child: Image.network(
                            "https://i.ytimg.com/vi/g3t6YDnGXAc/hqdefault.jpg",
                            width: 200,
                            height: 200,
                            scale: 1,
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dave Watson",
                            style: new TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.email),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "piistech@gmail.com",
                                style: new TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.call),
                              SizedBox(
                                width: 6,
                              ),
                              Text("537-55-9665",
                                  style: new TextStyle(fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Camden,OH 45311 \nAtlanta, GA 30303",
                                  style: new TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        Positioned(
            top: 245,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 10,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 120,
                      width: 200,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_box,
                            size: 36,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Estimate",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 120,
                      width: 200,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pie_chart,
                            size: 36,
                            color: Colors.white,
                          ),
                          Text(
                            "Recommended level",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 120,
                      width: 200,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.pie_chart,
                            size: 36,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Estimate",
                            style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
