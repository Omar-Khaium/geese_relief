import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget{

      final String name;
      final String address;
      final String phone;
      final String email;

      CustomerList(this.name, this.address, this.phone, this.email);

      @override
      Widget build(BuildContext context) {

    // TODO: implement build

      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person),
                              Text(name,style: new TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.call),
                              Text(phone,style: new TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.email),
                              Text(email,style: new TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),

                      ],
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.location_on),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(address,style: new TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      );
  }

}