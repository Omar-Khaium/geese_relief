import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerListFragment extends StatefulWidget {
  Login login;

  CustomerListFragment(this.login);

  @override
  _CustomerListFragmentState createState() => _CustomerListFragmentState();
}

class _CustomerListFragmentState extends State<CustomerListFragment> {

  List<NetworkCustomer> _NetWorkCustomers = [];
  List<Customer> _Customers = [];
  DBHelper dbHelper = new DBHelper();

  Future<List<NetworkCustomer>> makeRequest() {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'PageNo': '1',
      'PageSize': '10'
    };

    var url = "http://api.rmrcloud.com/GetAllCustomer";

    try{
      http.get(url, headers: headers).then((response) {
        if (response.statusCode == 200) {
          var map = json.decode(response.body);
          var _customersMap = map['CustomerList']['CustomerList'];
          _NetWorkCustomers = List.generate(_customersMap.length, (index){
            return NetworkCustomer.fromMap(_customersMap[index]);
          });
          setState(() {
            _Customers = List.generate(_NetWorkCustomers.length, (index){
              return Customer.fromNetworkCustomer(_NetWorkCustomers[index]);
            });
          });

        } else {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.GROUNDED,
            backgroundColor: Colors.redAccent,
            icon: Icon(
              Icons.error_outline,
              size: 24.0,
              color: Colors.white,
            ),
            duration: Duration(seconds: 4),
            leftBarIndicatorColor: Colors.white70,
            boxShadows: [
              BoxShadow(
                color: Colors.red[800],
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0,
              )
            ],
            title: "Authentication Error!",
            message: "Check your \'Username\' and \'Password\' again.",
            shouldIconPulse: false,
          )
            ..show(context);
        }

      });
    } catch(error){
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.GROUNDED,
        backgroundColor: Colors.redAccent,
        icon: Icon(
          Icons.error_outline,
          size: 24.0,
          color: Colors.white,
        ),
        duration: Duration(seconds: 4),
        leftBarIndicatorColor: Colors.white70,
        boxShadows: [
          BoxShadow(
            color: Colors.red[800],
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0,
          )
        ],
        title: "Authentication Error!",
        message: "Timeout!",
        shouldIconPulse: false,
      )..show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
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
                                Text(_Customers[index].name,style: new TextStyle(fontSize: 16),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.call),
                                Text(_Customers[index].contactNum,style: new TextStyle(fontSize: 16),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.email),
                                Text(_Customers[index].email,style: new TextStyle(fontSize: 16),)
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
                            child: Text(_Customers[index].address,style: new TextStyle(fontSize: 16),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              index!=_Customers.length-1 ? Divider() : Container(),
            ],
          ),
        );
      }, itemCount: _Customers.length,),
    );
  }
}
