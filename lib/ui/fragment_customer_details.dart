import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/model/estimate.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/customer_details_shimmer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class CustomerDetailsFragment extends StatefulWidget {
  Login login;
  String customerID;
  ValueChanged<int> backToDashboard;
  ValueChanged<String> goToBasementReport;

  CustomerDetailsFragment(
      {Key key,
      this.login,
      this.customerID,
      this.backToDashboard,
      this.goToBasementReport})
      : super(key: key);

  @override
  _CustomerDetailsFragmentState createState() =>
      _CustomerDetailsFragmentState();
}

class _CustomerDetailsFragmentState extends State<CustomerDetailsFragment> {
  CustomerDetails _customerDetails = new CustomerDetails(
      "", "", "", "", "", "", "", "", "", "", "", "", "", "", []);
  List<Estimate> list = [
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
    Estimate("0", "EST00000060", "Lorem Ipsum", "10", "27.90", "27-Dec-19"),
  ];

  getCustomerDetails() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'ID': widget.customerID.toString(),
    };

    var url = "http://api.rmrcloud.com/GetCustomerById";

    http.get(url, headers: headers).then((response) {
      if (response.statusCode == 200) {
        var map = json.decode(response.body);
        _customerDetails = CustomerDetails.fromMap(map["CustomerDetails"]);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCustomerDetails();
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
            child: Row(
              children: <Widget>[
                CustomBackButton(
                  onTap: () => widget.backToDashboard(0),
                ),
                SizedBox(
                  width: 16,
                ),
                Text("Customer Details", style: fragmentTitleStyle()),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var map = json.decode(snapshot.data.body);
                  _customerDetails =
                      CustomerDetails.fromMap(map["CustomerDetails"]);
                  _customerDetails.HasInspectionReport = map["Inspection"];
                  try {
                    return Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Material(
                              elevation: 4,
                              child: Container(
                                width: double.infinity,
                                height: 220,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              padding: EdgeInsets.only(top: 16),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(12)),
                                            child: Image.network(
                                                "https://i.ytimg.com/vi/g3t6YDnGXAc/hqdefault.jpg",
                                                width: 100,
                                                height: 100,
                                                scale: 1,
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                            width: 26,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                _customerDetails.Name,
                                                style: new TextStyle(
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.email),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    _customerDetails.Email,
                                                    style: new TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.call),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                      _customerDetails
                                                          .ContactNum,
                                                      style: new TextStyle(
                                                          fontSize: 16)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(Icons.location_on),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(_customerDetails.Address,
                                                      style: new TextStyle(
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Tooltip(
                                        child: SmoothStarRating(
                                            allowHalfRating: false,
                                            starCount: 6,
                                            rating: _customerDetails
                                                            .RecommendedLevel ==
                                                        null ||
                                                    _customerDetails
                                                        .RecommendedLevel
                                                        .isEmpty
                                                ? 0
                                                : int.parse(_customerDetails
                                                    .RecommendedLevel),
                                            size: 40,
                                            color: Colors.black,
                                            borderColor: Colors.grey.shade400,
                                            spacing: 0.0),
                                        message: "Recommended Level",
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 8,
                                            onPressed: () {
                                              widget.goToBasementReport(widget.customerID);
                                            },
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.all(24),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      MdiIcons.plus,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "${_customerDetails.HasInspectionReport ? "View" : "Add"} Basement Report",
                                                      style:
                                                          customButtonTextStyle(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Expanded(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 8,
                                            onPressed: () {},
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.all(24),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      getRecommendedLevelIcon(_customerDetails
                                                                      .RecommendedLevel ==
                                                                  null ||
                                                              _customerDetails
                                                                  .RecommendedLevel
                                                                  .isEmpty
                                                          ? 0
                                                          : int.parse(
                                                              _customerDetails
                                                                  .RecommendedLevel)),
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "Recommended Level",
                                                      style:
                                                          customButtonTextStyle(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Expanded(
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            elevation: 8,
                                            onPressed: () {},
                                            color: Colors.black,
                                            child: Padding(
                                              padding: const EdgeInsets.all(24),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.pie_chart,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Text(
                                                      "Add Estimate",
                                                      style:
                                                          customButtonTextStyle(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(MdiIcons.identifier),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                list[index].InvoiceId,
                                                style: listTextStyle(),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(MdiIcons.text),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                list[index].Description,
                                                style: listTextStyle(),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(MdiIcons.calendarClock),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                list[index].CreatedDate,
                                                style: listTextStyle(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(MdiIcons.layers),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                list[index].Quantity,
                                                style: listTextStyle(),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(MdiIcons.cashUsdOutline),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                list[index].Price,
                                                style: listTextStyle(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: Icon(
                                              Icons.email,
                                              color: Colors.black,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: Icon(
                                              Icons.content_copy,
                                              color: Colors.black,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.black,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                            itemCount: list.length,
                          ),
                        ),
                      ],
                    );
                  } catch (error) {
                    return Center(
                      child: Text(
                        "Something went wrong...",
                        style: listTextStyle(),
                      ),
                    );
                  }
                } else {
                  return ShimmerCustomerDetailsFragment();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'ID': '${widget.customerID}'
    };

    var url = "http://api.rmrcloud.com/GetCustomerById";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return {};
    }
  }

  IconData getRecommendedLevelIcon(int level) {
    switch (level) {
      case 0:
        return Icons.exposure_zero;
      case 1:
        return Icons.looks_one;
      case 2:
        return Icons.looks_two;
      case 3:
        return Icons.looks_3;
      case 4:
        return Icons.looks_4;
      case 5:
        return Icons.looks_5;
      case 6:
        return Icons.looks_6;
    }
  }
}
