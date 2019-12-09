import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddContact extends StatefulWidget {
  @override
  _addContact createState() => _addContact();
}

class _addContact extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          padding: EdgeInsets.all(36),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "Primary Phone",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "Secondary Phone",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Cell Phone",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Email",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "Street",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                  MdiIcons.road,
                    color: Colors.grey,
                  ),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                cursorColor: Colors.black87,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: new InputDecoration(
                  labelText: "City",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  icon: new Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "State",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          MdiIcons.homeCity,
                          color: Colors.grey,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      cursorColor: Colors.black87,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: new InputDecoration(
                        labelText: "Secondary Phone",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        icon: new Icon(
                          Icons.call,
                          color: Colors.grey,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          )),
    );
  }
}
