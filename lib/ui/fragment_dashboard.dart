import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/utils.dart';
import 'package:flutter_grate_app/widgets/customer_list_shimmer.dart';
import 'package:flutter_grate_app/widgets/list_row_item.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_customer.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_multiline_customer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardFragment extends StatefulWidget {
  ValueChanged<String> goToCustomerDetails;
  Login login;

  DashboardFragment({Key key, this.login, this.goToCustomerDetails})
      : super(key: key);

  @override
  _DashboardFragmentState createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  List<Customer> arrayList = [];
  Customer customer;

  bool _showPaginationShimmer = false;
  ScrollController _scrollController;
  int _pageNo = 0;

  var _future;

  Future getData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'PageNo': (++_pageNo).toString(),
      'PageSize': '10'
    };

    var result = await http.get(BASE_URL+API_GET_ALL_CUSTOMER, headers: headers);
    if (result.statusCode == 200) {

      var map = json.decode(result.body);
      var _customersMap = map['data']['CustomerList'];
      arrayList = List.generate(_customersMap.length, (index) {
        return Customer.fromMap(_customersMap[index]);
      });

      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }

  Future fetchData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'PageNo': (++_pageNo).toString(),
      'PageSize': '10'
    };

    var result = await http.get(BASE_URL+API_GET_ALL_CUSTOMER, headers: headers);
    if (result.statusCode == 200) {
      var map = json.decode(result.body);
      var _customersMap = map['data']['CustomerList'];
      List<Customer> _arrayList = List.generate(_customersMap.length, (index) {
        return Customer.fromMap(_customersMap[index]);
      });
      setState(() {
        arrayList.addAll(_arrayList);
      });
      return _arrayList;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _showPaginationShimmer = false;
    _future = getData();
    super.initState();
  }

  _scrollListener() async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange && !_showPaginationShimmer) {
      setState(() {
        _showPaginationShimmer = true;
      });
      await fetchData();
      setState(() {
        arrayList = arrayList;
      });
      setState(() {
        _showPaginationShimmer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dashboard",
                style: fragmentTitleStyle(),
              )),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  try {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: _scrollController,
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: arrayList.length,
                          itemBuilder: (context, index) {
                            customer = arrayList[index];
                            return InkWell(
                              onTap: () {
                                widget
                                    .goToCustomerDetails(arrayList[index].Id);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ListRowItem(
                                              icon: Icons.person,
                                              text: customer.Name,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ListRowItem(
                                              icon: Icons.phone,
                                              text: customer.ContactNum,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            ListRowItem(
                                              icon: Icons.email,
                                              text: customer.Email,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ListRowItem(
                                              icon: Icons.pin_drop,
                                              text: customer.Address,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            child: IconButton(
                                              icon: new Icon(
                                                MdiIcons.deleteForever,
                                                size: 18,
                                                color:
                                                    Colors.redAccent.shade200,
                                              ),
                                              onPressed: () {
                                                deleteCustomer(index);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                        _showPaginationShimmer ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ShimmerItemCustomer(250),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      ShimmerItemCustomer(125),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      ShimmerItemCustomer(175),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ShimmerItemMultiLineCustomer(300),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ) : Container(),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    );
                  } catch (error) {
                    return Container();
                  }
                } else {
                  return Container(
                    child: Center(
                      child: ShimmerDashboardFragment(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future deleteCustomer(int index) async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'customerid': arrayList[index].Id,
    };

    var result = await http.delete(BASE_URL+API_DELETE_CUSTOMER, headers: headers);
    if (result.statusCode == 200) {
      arrayList.removeAt(index);
      setState(() {});
      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }

  void showPopup(index) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            title: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Delete ?" +arrayList[index].Name,
                                style: new TextStyle(
                                    color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 20,
                        margin: EdgeInsets.only(top: 2, bottom: 2),
                        child: Divider(
                          color: Colors.grey,
                          thickness: .5,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Are you sure you want to delete ?",
                          style: new TextStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 128,
                              child: RaisedButton(
                                highlightElevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(36.0),
                                    side: BorderSide(color: Colors.white12)),
                                disabledColor: Colors.black,
                                color: Colors.green,
                                elevation: 2,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Cancel",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Roboto"),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                              width: 128,
                              child: RaisedButton(
                                highlightElevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(36.0),
                                    side: BorderSide(color: Colors.white12)),
                                disabledColor: Colors.black,
                                color: Colors.red.shade200,
                                elevation: 2,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Delete",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Roboto"),
                                ),
                                onPressed: () {
                                 deleteCustomer(index);
                                 Navigator.of(context).pop();
                                 setState(() {}
                                 );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
