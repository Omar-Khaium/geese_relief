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
}
