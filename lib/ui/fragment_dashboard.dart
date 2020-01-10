import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/utils.dart';
import 'package:flutter_grate_app/widgets/customer_list_shimmer.dart';
import 'package:flutter_grate_app/widgets/list_row_item.dart';
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

  Future getData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'PageNo': '1',
      'PageSize': '10'
    };

    var url = "https://api.rmrcloud.com/GetAllCustomer";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
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
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  try {
                    var map = json.decode(snapshot.data.body);
                    var _customersMap = map['customerlist']['CustomerList'];
                    arrayList = List.generate(_customersMap.length, (index) {
                      return Customer.fromMap(_customersMap[index]);
                    });

                    return ListView.builder(
                      itemCount: arrayList.length,
                      itemBuilder: (context, index) {
                        customer = arrayList[index];
                        return InkWell(
                          onTap: () {
                            widget.goToCustomerDetails(arrayList[index].Id);
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
                                        backgroundColor: Colors.grey.shade100,
                                        child: IconButton(
                                          icon: new Icon(
                                            Icons.edit,
                                            size: 18,
                                            color: Colors.grey.shade700,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.grey.shade100,
                                        child: IconButton(
                                          icon: new Icon(
                                            MdiIcons.deleteForever,
                                            size: 18,
                                            color: Colors.redAccent.shade200,
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
                              arrayList.length - 1 == index
                                  ? Container()
                                  : Container(
                                      child: Divider(),
                                    ),
                            ],
                          ),
                        );
                      },
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

    var url = "https://api.rmrcloud.com/DeleteCustomer";
    var result = await http.delete(url, headers: headers);
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
