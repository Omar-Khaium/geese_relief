import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/place_image.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:flutter_grate_app/widgets/widget_drawing.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:painter/painter.dart';

import '../utils.dart';

class AddEstimateFragment extends StatefulWidget {
  Login login;
  LoggedInUser loggedInUser;
  CustomerDetails customer;
  ValueChanged<String> backToCustomerDetails;

  AddEstimateFragment(
      {Key key,
      this.login,
      this.loggedInUser,
      this.customer,
      this.backToCustomerDetails})
      : super(key: key);

  @override
  _AddEstimateFragmentState createState() => _AddEstimateFragmentState();
}

class _AddEstimateFragmentState extends State<AddEstimateFragment> {
  String dollar = "\$";
  TextEditingController _productNameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  TextEditingController _quantityController = new TextEditingController();
  TextEditingController _discountController = new TextEditingController();

  Widget _Drawing = Container();

  String base64Drawing = "";
  var _days = ['After 15 days', 'After 30 days', 'After 60 days'];
  var _currentValueSelected = "After 15 days";

  _generateDrawingPicture(PictureDetails picture) {
    _Drawing = PlaceImageFromPicture(picture);
    picture.toPNG().then((val) {
      base64Drawing = base64.encode(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd-yyyy').format(now);
    print(formattedDate);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 16, left: 32, right: 32),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    CustomBackButton(
                      onTap: () =>
                          widget.backToCustomerDetails(widget.customer.Id),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("EST1000084", style: fragmentTitleStyle()),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Creating estimate for, " + widget.customer.FirstName,
                      style: new TextStyle(fontSize: 20),
                    )),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 220,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.email),
                                      Text(widget.customer.Email),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 220,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(MdiIcons.calendarMonth),
                                      Text(formattedDate.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 220,
                                  height: 43,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: _days
                                          .map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem),
                                        );
                                      }).toList(),
                                      onChanged: (String newValueSelected) {
                                        setState(() {
                                          this._currentValueSelected =
                                              newValueSelected;
                                        });
                                      },
                                      value: _currentValueSelected,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 220,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(MdiIcons.calendarMonth),
                                      Text("1-14-2020"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Amount",
                        style: new TextStyle(fontSize: 24),
                      ),
                      Text(
                        "$dollar 0.00",
                        style: new TextStyle(fontSize: 64),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 64,
                        width: 156,
                        child: RaisedButton(
                          highlightElevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(36.0),
                              side: BorderSide(color: Colors.white12)),
                          disabledColor: Colors.black,
                          color: Colors.black,
                          elevation: 2,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.add),
                              Text(
                                "New",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Roboto"),
                              ),
                            ],
                          ),
                          onPressed: () {
                            showPopUp();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 150,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.identifier),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        ("1"),
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
                                        ("1"),
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
                                        ("1"),
                                        style: listTextStyle(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.layers),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        ("1"),
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
                                        ("1"),
                                        style: listTextStyle(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
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
                                    backgroundColor: Colors.grey.shade300,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.content_copy,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          //getDuplicateEstimate(index);
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
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
                    }),
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DrawingDialog(
                                  picture: _generateDrawingPicture);
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: new BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(width: 1.0, color: Colors.black26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          child: _Drawing,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DrawingDialog(
                                      picture: _generateDrawingPicture);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 150,
                    width: 200,
                    child: SizedBox(
                      height: 140,
                      width: 190,
                      child: TextField(
                        style: customTextStyle(),
                        cursorColor: Colors.black87,
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write note here..",
                          hintStyle: customHintStyle(),
                          isDense: true,
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    padding: EdgeInsets.all(8),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Subtotal  "),
                            Container(
                              width: 150,
                              margin: EdgeInsets.only(top: 8, bottom: 8),
                              child: Divider(
                                color: Colors.grey,
                                thickness: .5,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("\$ 0.00"),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Discount  "),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 66,
                                  height: 24,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  width: 66,
                                  height: 24,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text("\$ 0.00"),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Subtotal  "),
                            Container(
                              width: 150,
                              margin: EdgeInsets.only(top: 8, bottom: 8),
                              child: Divider(
                                color: Colors.grey,
                                thickness: .5,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("\$ 0.00"),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 64,
                          height: 24,
                          decoration: new BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.rectangle,
                              border:
                                  Border.all(width: 1.0, color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          padding: EdgeInsets.all(8),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Est.Total  "),
                            Container(
                              width: 150,
                              margin: EdgeInsets.only(top: 8, bottom: 8),
                              child: Divider(
                                color: Colors.grey,
                                thickness: .5,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("\$ 0.00"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 36),
                      height: 48,
                      width: 142,
                      child: RaisedButton(
                        highlightElevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(36.0),
                            side: BorderSide(color: Colors.white12)),
                        disabledColor: Colors.black,
                        color: Colors.black,
                        elevation: 2,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Send Email",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 36),
                      height: 48,
                      width: 142,
                      child: RaisedButton(
                        highlightElevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(36.0),
                            side: BorderSide(color: Colors.white12)),
                        disabledColor: Colors.black,
                        color: Colors.black,
                        elevation: 2,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "View Proposal",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 36),
                      height: 48,
                      width: 142,
                      child: RaisedButton(
                        highlightElevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(36.0),
                            side: BorderSide(color: Colors.white12)),
                        disabledColor: Colors.black,
                        color: Colors.black,
                        elevation: 2,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Save",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showPopUp() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Add Product/Service",
                  style: new TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.rectangle,
                              border:
                                  Border.all(width: 1.0, color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            child:
                                TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                autofocus: true,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Product Name",
                                  icon: Icon(MdiIcons.cube),
                                  hintStyle: customHintStyle(),
                                  isDense: true,
                                ),
                              ),
                              suggestionsCallback: (pattern) async {
                                return await getData(pattern);
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  leading: Icon(MdiIcons.package),
                                  title: Text(suggestion['EquipmentName']),
                                  subtitle: Text(suggestion['EquipmentType']),
                                  trailing:
                                      Text('\$ ${suggestion['RetailPrice']}'),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                _productNameController.text =
                                    suggestion['EquipmentName'];
                                _descriptionController.text =
                                    suggestion['EquipmentName'];
                                _quantityController.text =
                                    suggestion['QuantityAvailable'];
                                _priceController.text =
                                    suggestion['RetailPrice'];
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 165,
                                decoration: new BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        width: 1.0, color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                padding: EdgeInsets.all(8),
                                child: TextField(
                                  style: customTextStyle(),
                                  cursorColor: Colors.black87,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Product Description",
                                    icon: Icon(Icons.description),
                                    hintStyle: customHintStyle(),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      padding: EdgeInsets.all(8),
                                      child: TextField(
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Rate",
                                          icon: Icon(Icons.attach_money),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      padding: EdgeInsets.all(8),
                                      child: TextField(
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Rate",
                                          icon: Icon(Icons.attach_money),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      padding: EdgeInsets.all(8),
                                      child: TextField(
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Rate",
                                          icon: Icon(Icons.attach_money),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 1.0, color: Colors.black26),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            padding: EdgeInsets.all(8),
                            child: TextField(
                              style: customTextStyle(),
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: "Quantity",
                                icon: Icon(Icons.clear),
                                hintStyle: customHintStyle(),
                                isDense: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 170,
                            width: 200,
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 1.0, color: Colors.black26),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            padding: EdgeInsets.all(8),
                            child: Center(
                                child: Text(
                              "Add Image",
                              style: new TextStyle(
                                  color: Colors.black26, fontSize: 22),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 128,
                      child: OutlineButton(
                        highlightElevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(36.0),
                            side: BorderSide(color: Colors.white12)),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Cancel",
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: "Roboto"),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 128,
                      child: RaisedButton(
                        highlightElevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(36.0),
                            side: BorderSide(color: Colors.white12)),
                        disabledColor: Colors.black,
                        color: Colors.black,
                        elevation: 2,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Add",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Roboto"),
                        ),
                        onPressed: () {
                          if (widget.login.isRemembered) {
                            Navigator.of(context).pop();
                          } else {
                            Center(
                              child: Text(
                                "Save your password first",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Future getData(String pattern) async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'Key': pattern.trim()
    };

    var url = "http://api.rmrcloud.com/GetEquipmentListByKey";
    var result = await http.get(url, headers: headers);
    if (result.statusCode == 200) {
      return json.decode(result.body)['EquipmentList'];
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return [];
    }
  }
}
