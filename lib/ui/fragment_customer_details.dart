import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/model/estimate.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/customer_details_shimmer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../utils.dart';

class CustomerDetailsFragment extends StatefulWidget {
  final Login login;
  final String customerID;
  final ValueChanged<int> backToDashboard;
  final ValueChanged<CustomerDetails> goToAddBasementReport;
  final ValueChanged<CustomerDetails> goToUpdateBasementReport;
  final ValueChanged<CustomerDetails> goToAddEstimate;
  final ValueChanged<CustomerDetails> goToUpdateEstimate;
  final ValueChanged<CustomerDetails> goToRecommendedLevel;
  CustomerDetails customer;
  LoggedInUser loggedInUser;

  CustomerDetailsFragment(
      {Key key,
      this.login,
      this.customerID,
      this.customer,
      this.backToDashboard,
      this.goToAddBasementReport,
      this.goToUpdateBasementReport,
      this.goToAddEstimate,
      this.goToUpdateEstimate,
      this.goToRecommendedLevel,
      this.loggedInUser})
      : super(key: key);

  @override
  _CustomerDetailsFragmentState createState() =>
      _CustomerDetailsFragmentState();
}

class _CustomerDetailsFragmentState extends State<CustomerDetailsFragment> {
//  var _future;
  List<Estimate> _list = [];
  var _base64Image;

  //-------------Image---------------
  File _imageFile;

  _openGallery(BuildContext context) async {
    File pickFromGallery =
        (await ImagePicker.pickImage(source: ImageSource.gallery));
    setState(() {
      _imageFile = pickFromGallery;
      _base64Image = base64Encode(_imageFile.readAsBytesSync());
      uploadCustomerImage();
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    File pickFromCamera =
        (await ImagePicker.pickImage(source: ImageSource.camera));
    setState(() {
      _imageFile = pickFromCamera;
      _base64Image = base64Encode(_imageFile.readAsBytesSync());
      uploadCustomerImage();
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
//    _future = getData();
    super.initState();
    getDate();
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make A choice"),
            content: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: GestureDetector(
                        child: Text("Gallery"),
                        onTap: () {
                          widget.customer.ProfileImage = null;
                          _openGallery(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: GestureDetector(
                        child: Text("Camera"),
                        onTap: () {
                          widget.customer.ProfileImage = null;
                          _openCamera(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }


  //-------------Image---------------

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
                try {
                  if (snapshot.hasData) {
                    var map = json.decode(snapshot.data.body);
                    var estimateMap = map['EstimateList']['EstimateList'];
                    if (estimateMap == null) {
                      _list = [];
                    } else {
                      _list = List.generate(estimateMap.length, (index) {
                        return Estimate.fromMap(estimateMap[index]);
                      });
                    }
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
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                ClipRRect(
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    child: Container(
                                                      child: _imageFile != null
                                                          ? Image.file(
                                                        _imageFile,
                                                        width: 150,
                                                        height: 140,
                                                        fit: BoxFit.cover,
                                                      )
                                                          : (widget.customer
                                                          .ProfileImage !=
                                                          null && widget.customer.ProfileImage.isNotEmpty
                                                          ? Image.network(
                                                          widget.customer
                                                              .ProfileImage,
                                                          height: 128,
                                                          width: 128,
                                                          fit: BoxFit
                                                              .cover)
                                                          : Icon(
                                                        Icons.person,
                                                        size: 142,
                                                      )),
                                                      color: Colors.grey.shade100,
                                                    )),
                                                Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey.shade500,
                                                      child: GestureDetector(
                                                        child: Icon(
                                                          MdiIcons
                                                              .circleEditOutline,
                                                          color: Colors.white,
                                                        ),
                                                        onTap: () {
                                                          _showDialog(context);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
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
                                                  widget.customer.Name,
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
                                                      widget.customer.Email,
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
                                                        widget.customer
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
                                                    Text(
                                                      widget.customer.Address,
                                                      style: listTextStyle(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
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
                                                if(widget.customer.HasInspectionReport){
                                                  widget.goToUpdateBasementReport(
                                                      widget.customer);
                                                }
                                                else{
                                                  widget.goToAddBasementReport(
                                                      widget.customer);
                                                }

                                              },
                                              color: Colors.black,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Icon(
                                                        widget.customer
                                                                .HasInspectionReport
                                                            ? MdiIcons
                                                                .fileDocumentBoxMultiple
                                                            : MdiIcons
                                                                .plusBoxMultiple,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      Text(
                                                        "${widget.customer.HasInspectionReport ? "View" : "Add"} Basement Report",
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
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 8,
                                              onPressed: () {
                                                widget.goToRecommendedLevel(
                                                    widget.customer);
                                              },
                                              color: Colors.black,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      SmoothStarRating(
                                                          allowHalfRating:
                                                              false,
                                                          starCount: 6,
                                                          rating: widget
                                                              .customer
                                                              .RecommendedLevel,
                                                          size: 24,
                                                          color: Colors.white,
                                                          borderColor:
                                                              Colors.white),
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
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 8,
                                              onPressed: () {
                                                widget.goToAddEstimate(
                                                    widget.customer);
                                              },
                                              color: Colors.black,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24),
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
                                return InkWell(
                                  child: Column(
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
                                                    _list[index].InvoiceId,
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
                                                    _list[index].Description,
                                                    style: listTextStyle(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                                    _list[index].CreatedDate,
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
                                                    _list[index].Quantity,
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
                                                    "${_list[index].Price==null || _list[index].Price=="0.0" ? 0.0 : currencyFormat.format(double.parse(_list[index].Price))}"
                                                    ,
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
                                                child: InkWell(
                                                  child: Icon(
                                                    Icons.content_copy,
                                                    color: Colors.black,
                                                    size: 18,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      duplicateDialog(index);
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  deleteDialog(index);
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade300,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.black,
                                                    size: 18,
                                                  ),
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
                                  ),
                                  onTap: () {
                                    widget.customer.EstimateId =
                                        _list[index].InvoiceId;
                                    widget.customer.EstimateIntId =
                                        int.parse(_list[index].Id);
                                    widget.goToUpdateEstimate(widget.customer);
                                  },
                                );
                              },
                              itemCount: _list.length,
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
                  }
                  else {
                    return ShimmerCustomerDetailsFragment();
                  }
                } catch (error) {
                  return Center(
                    child: Text(
                      "Something went wrong...",
                      style: listTextStyle(),
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

  Future getData() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'CustomerIntId': '${widget.customerID}',
      'PageNo': '1',
      'PageSize': '10',
    };

    var url = "https://api.gratecrm.com/GetCustomerByIdWithEstimateList";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      widget.customer = CustomerDetails.fromMap(json.decode(result.body));
      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return {};
    }
  }

  Future uploadCustomerImage() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'CustomerId': '${widget.customerID}',
    };
    Map<String, String> body = <String, String>{
      "filename": "Demo-File.png",
      "filepath": _base64Image
    };

    var url = "https://api.gratecrm.com/CustomerImageUpload";
    http.post(url, headers: headers, body: body).then((response) {
      try {
        if (response.statusCode == 200) {
          return response;
        } else {
          showMessage(context, "Network error!", json.decode(response.body),
              Colors.redAccent, Icons.warning);
          return [];
        }
      } catch (error) {
        return Container();
      }
    });
  }

  Future duplicateEstimate(int index) async {
    try {
      Map<String, String> headers = {
        'Authorization': widget.login.accessToken,
        'EstimateId': _list[index].Id,
        'CompanyId': widget.loggedInUser.CompanyGUID,
      };
      var url = "https://api.gratecrm.com/EstimateDuplicate";
      var result = await http.post(url, headers: headers);
      if (result.statusCode == 200) {
        Map map = json.decode(result.body);
        return map['Result'];
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  IconData getRecommendedLevelIcon(int level) {
    switch (level) {
      case 0:
        {
          return Icons.exposure_zero;
        }
        break;
      case 1:
        {
          return Icons.looks_one;
        }
        break;
      case 2:
        {
          return Icons.looks_two;
        }
        break;
      case 3:
        {
          return Icons.looks_3;
        }
        break;
      case 4:
        {
          return Icons.looks_4;
        }
        break;
      case 5:
        {
          return Icons.looks_5;
        }
        break;
      case 6:
        {
          return Icons.looks_6;
        }
        break;
      default:
        {
          return Icons.exposure_zero;
        }
    }
  }

  void deleteDialog(int index) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            title: Text(
              "Deleting Estimate",
              style: estimateTextStyle(),
            ),
            contentTextStyle: estimateTextStyle(),
          ),
        );
      },
    );
    try {
      bool status = await deleteEstimate(index);
      if (status) {
        _list.removeAt(index);
        setState(() {});
      }
      Navigator.of(context).pop();
      showAPIResponse(
          context,
          status ? "Deleted Successfully!" : "Failed to Delete!",
          Color(status ? COLOR_SUCCESS : COLOR_DANGER));
    } catch (error) {
      Navigator.of(context).pop();
      showAPIResponse(context, "Failed to Delete!", Color(COLOR_DANGER));
    }
  }

  void duplicateDialog(int index) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            title: Text(
              "Duplicating Estimate",
              style: estimateTextStyle(),
            ),
            contentTextStyle: estimateTextStyle(),
          ),
        );
      },
    );
    try {
      bool status = await duplicateEstimate(index);
      if (status) {
        setState(() {});
      }
      Navigator.of(context).pop();
      showAPIResponse(
          context,
          status ? "Duplicated Successfully!" : "Failed to Duplicated!",
          Color(status ? COLOR_SUCCESS : COLOR_DANGER));
    } catch (error) {
      Navigator.of(context).pop();
      showAPIResponse(context, "Failed to Duplicated!", Color(COLOR_DANGER));
    }
  }

  Future deleteEstimate(int index) async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'EstimateId': _list[index].Id
    };

    var url = "https://api.gratecrm.com/DeleteEstimate";
    var result = await http.delete(url, headers: headers);
    return json.decode(result.body)['result'];
  }

  Future getDate() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
    };

    var url = "https://api.gratecrm.com/GetOrganizationList";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      Map map=json.decode(result.body);
      print(map['orglist'][0]['text']);
      return result;

    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return {};
    }
  }
}
