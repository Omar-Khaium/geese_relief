import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/model/product.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/drawing_placeholder.dart';
import 'package:flutter_grate_app/widgets/place_image.dart';
import 'package:flutter_grate_app/widgets/shimmer_estimate.dart';
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
  ValueChanged<CustomerDetails> backToCustomerDetailsFromEstimate;

  AddEstimateFragment(
      {Key key,
      this.login,
      this.loggedInUser,
      this.customer,
      this.backToCustomerDetailsFromEstimate})
      : super(key: key);

  @override
  _AddEstimateFragmentState createState() => _AddEstimateFragmentState();
}

class _AddEstimateFragmentState extends State<AddEstimateFragment> {
  String dollar = "\$";
  TextEditingController _productNameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _rateController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  TextEditingController _quantityController = new TextEditingController();
  TextEditingController _discountController = new TextEditingController();
  TextEditingController _EstimateDiscountController =
      new TextEditingController();
  bool _discountModeIsPercentage = true;
  GlobalKey _columnKey = GlobalKey();
  Widget _Drawing = Container();
  List<Product> _productList = [];
  Product selectedProduct;

  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

  String base64Drawing = "";
  String estimateId = "";
  String nextDate = "";
  var _days = ['After 15 days', 'After 30 days', 'After 60 days'];
  var _DiscountType = ['Cash', 'Percantage'];
  var _TaxType = ['Sales Tax', 'Non-Tax', 'Non-Profit'];
  var _currentValueSelected = "After 15 days";
  var _DiscountTypeSelectedValue = "Cash";
  var _TaxTypeSelectedValue = "Sales Tax";

  double estimateBaseSubTotal = 0.0;
  double estimateDiscountTotal = 0.0;
  double estimateMainSubtotal = 0.0;
  double estimateTaxTotal = 0.0;
  double estimateTotalAmount = 0.0;

  _generateDrawingPicture(PictureDetails picture) {
    _Drawing = PlaceImageFromPicture(picture);
    picture.toPNG().then((val) {
      base64Drawing = base64.encode(val);
    });
  }

  @override
  void initState() {
    _Drawing = DrawingPlaceholder();
    nextDate =
        DateFormat('MM/dd/yyyy').format(DateTime.now().add(Duration(days: 15)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 32, right: 32),
      child: FutureBuilder(
        future: getGeneratedEstimate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: <Widget>[
                                    CustomBackButton(
                                      onTap: () => widget
                                          .backToCustomerDetailsFromEstimate(
                                          widget.customer),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(snapshot.data.toString(),
                                        style: fragmentTitleStyle()),
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
                                      "Creating estimate for, " +
                                          widget.customer.FirstName,
                                      style: new TextStyle(fontSize: 20),
                                    )),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 256,
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      Colors.grey.shade200,
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                          Colors.black26),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0))),
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Icon(Icons.email),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        widget.customer.Email,
                                                        style:
                                                        estimateTextStyle(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                  EdgeInsets.only(left: 8),
                                                  width: 144,
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      Colors.grey.shade200,
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                          Colors.black26),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0))),
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Icon(MdiIcons
                                                          .calendarMonth),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        formattedDate
                                                            .toString(),
                                                        style:
                                                        estimateTextStyle(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
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
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: 256,
                                                  height: 48,
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      Colors.grey.shade200,
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                          Colors.black26),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0))),
                                                  padding: EdgeInsets.all(8),
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child:
                                                    DropdownButton<String>(
                                                      items: _days.map((String
                                                      dropDownStringItem) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                          dropDownStringItem,
                                                          child: Text(
                                                            dropDownStringItem,
                                                            style:
                                                            estimateTextStyle(),
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String
                                                      newValueSelected) {
                                                        setState(() {
                                                          this._currentValueSelected =
                                                              newValueSelected;
                                                          switch (
                                                          _currentValueSelected) {
                                                            case "After 15 days":
                                                              {
                                                                nextDate = DateFormat(
                                                                    'MM/dd/yyyy')
                                                                    .format(DateTime
                                                                    .now()
                                                                    .add(Duration(
                                                                    days:
                                                                    15)));
                                                              }
                                                              break;
                                                            case "After 30 days":
                                                              {
                                                                nextDate = DateFormat(
                                                                    'MM/dd/yyyy')
                                                                    .format(DateTime
                                                                    .now()
                                                                    .add(Duration(
                                                                    days:
                                                                    30)));
                                                              }
                                                              break;
                                                            case "After 60 days":
                                                              {
                                                                nextDate = DateFormat(
                                                                    'MM/dd/yyyy')
                                                                    .format(DateTime
                                                                    .now()
                                                                    .add(Duration(
                                                                    days:
                                                                    60)));
                                                              }
                                                              break;
                                                          }
                                                        });
                                                      },
                                                      value:
                                                      _currentValueSelected,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 144,
                                                  margin:
                                                  EdgeInsets.only(left: 8),
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      Colors.grey.shade200,
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 1.0,
                                                          color:
                                                          Colors.black26),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0))),
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      Icon(MdiIcons
                                                          .calendarMonth),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        nextDate,
                                                        style:
                                                        estimateTextStyle(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
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
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Amount",
                                style: estimateTextStyle(),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "$dollar ${estimateTotalAmount.toStringAsFixed(2)}",
                                style: fragmentTitleStyle(),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: RaisedButton(
                                  highlightElevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(36.0),
                                      side: BorderSide(color: Colors.white12)),
                                  disabledColor: Colors.black,
                                  color: Colors.black,
                                  elevation: 2,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 12, bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(Icons.add),
                                      Text(
                                        "Add Product",
                                        style: customButtonTextStyle(),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    _productNameController.text = "";
                                    _descriptionController.text = "";
                                    _quantityController.text = "";
                                    _rateController.text = "";
                                    _discountController.text = "";
                                    _priceController.text = "";
                                    showPopUp();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _productList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(MdiIcons.cubeOutline),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          _productList[index].Name,
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
                                          _productList[index].Description,
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
                                          _productList[index].Date,
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
                                          _productList[index]
                                              .Quantity
                                              .toString(),
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
                                          _productList[index]
                                              .Rate
                                              .toString(),
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
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _productList.removeAt(index);
                                            estimateTotalCalculation();
                                          });
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
                            Divider(),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    height: 150,
                                    decoration: new BoxDecoration(
                                        color: Colors.grey.shade200,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            width: 1.0,
                                            color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: InkWell(
                                      child: _Drawing,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DrawingDialog(
                                                  picture:
                                                  _generateDrawingPicture);
                                            },
                                          ),
                                        );
                                      },
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
                                        keyboardType:
                                        TextInputType.emailAddress,
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
                                        border: Border.all(
                                            width: 1.0,
                                            color: Colors.black26),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    padding: EdgeInsets.all(8),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Subtotal"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      SizedBox(
                                        width: 288,
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: .5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                          "\$ ${estimateBaseSubTotal.toStringAsFixed(2)}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Discount"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      SizedBox(
                                        width: 288,
                                        height: 48,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: 140,
                                              height: 36,
                                              decoration: new BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Colors.black26),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          5.0))),
                                              padding: EdgeInsets.all(8),
                                              child:
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  items: _DiscountType.map(
                                                          (String
                                                      dropDownStringItem) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value:
                                                          dropDownStringItem,
                                                          child: Text(
                                                              dropDownStringItem),
                                                        );
                                                      }).toList(),
                                                  onChanged: (String
                                                  newValueSelected) {
                                                    setState(() {
                                                      this._DiscountTypeSelectedValue =
                                                          newValueSelected;
                                                      switch (
                                                      _DiscountTypeSelectedValue) {
                                                        case "Select One":
                                                          {
                                                            nextDate = DateFormat(
                                                                'MM/dd/yyyy')
                                                                .format(DateTime
                                                                .now()
                                                                .add(Duration(
                                                                days:
                                                                15)));
                                                          }
                                                          break;
                                                        case "Cash":
                                                          {
                                                            nextDate = DateFormat(
                                                                'MM/dd/yyyy')
                                                                .format(DateTime
                                                                .now()
                                                                .add(Duration(
                                                                days:
                                                                30)));
                                                          }
                                                          break;
                                                        case "Percantage":
                                                          {
                                                            nextDate = DateFormat(
                                                                'MM/dd/yyyy')
                                                                .format(DateTime
                                                                .now()
                                                                .add(Duration(
                                                                days:
                                                                60)));
                                                          }
                                                          break;
                                                      }
                                                      estimateTotalCalculation();
                                                    });
                                                  },
                                                  value:
                                                  _DiscountTypeSelectedValue,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Container(
                                              width: 140,
                                              height: 36,
                                              decoration: new BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Colors.black26),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          5.0))),
                                              padding: EdgeInsets.all(2),
                                              child: TextFormField(
                                                controller:
                                                _EstimateDiscountController,
                                                style: customTextStyle(),
                                                onChanged: (val) =>
                                                    estimateTotalCalculation(),
                                                cursorColor: Colors.black87,
                                                keyboardType:
                                                TextInputType.number,
                                                maxLines: 1,
                                                autofocus: true,
                                                decoration:
                                                new InputDecoration(
                                                  alignLabelWithHint: true,
                                                  hintText:
                                                  _DiscountTypeSelectedValue ==
                                                      "Cash"
                                                      ? "Amount"
                                                      : "Percentage",
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                      BorderSide
                                                          .none),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                      BorderSide
                                                          .none),
                                                  icon: Icon(
                                                    _DiscountTypeSelectedValue ==
                                                        "Cash"
                                                        ? MdiIcons.cashRefund
                                                        : MdiIcons
                                                        .filePercent,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  hintStyle:
                                                  customHintStyle(),
                                                  isDense: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                          "\$ ${estimateDiscountTotal.toStringAsFixed(2)}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Subtotal"),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      SizedBox(
                                        width: 288,
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: .5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                          "\$ ${estimateMainSubtotal.toStringAsFixed(2)}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 144,
                                        height: 36,
                                        child: Container(
                                          decoration: new BoxDecoration(
                                              color: Colors.grey.shade200,
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.black26),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          padding: EdgeInsets.all(8),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              items: _TaxType.map((String
                                              dropDownStringItem) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: dropDownStringItem,
                                                  child: Text(
                                                      dropDownStringItem),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (String newValueSelected) {
                                                setState(() {
                                                  this._TaxTypeSelectedValue =
                                                      newValueSelected;

                                                  estimateTotalCalculation();
                                                });
                                              },
                                              value: _TaxTypeSelectedValue,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: .5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                          "\$ ${estimateTaxTotal.toStringAsFixed(2)}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Est. Total"),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      SizedBox(
                                        width: 288,
                                        child: Divider(
                                          color: Colors.grey,
                                          thickness: .5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                          "\$ ${estimateTotalAmount.toStringAsFixed(2)}"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                /*Container(
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
                                          onPressed: () {},
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
                                          onPressed: () {},
                                        ),
                                      ),*/
                                Container(
                                  height: 48,
                                  width: 144,
                                  child: RaisedButton(
                                    highlightElevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(36.0),
                                        side: BorderSide(
                                            color: Colors.white12)),
                                    disabledColor: Colors.black,
                                    color: Colors.black,
                                    elevation: 2,
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Save",
                                      style: customButtonTextStyle(),
                                    ),
                                    onPressed: () {
                                      if (_productList.length == 0) {
                                        showError("Product list is empty!");
                                      } else {
                                        showSaving("Please wait...");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return ShimmerAddOrEditEstimate();
          }
        },
      ),
    );
  }

  void showPopUp() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  "Add Product/Service",
                  style: new TextStyle(fontSize: 24, color: Colors.black),
                ),
                content: SizedBox(
                  width: 600,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: TypeAheadField(
                                           textFieldConfiguration:
                                        TextFieldConfiguration(
                                            controller: _productNameController,
                                            autofocus: true,
                                            keyboardType: TextInputType.text,
                                            maxLines: 1,
                                            decoration: new InputDecoration(
                                              labelText: "Product",
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              icon: new Icon(
                                                MdiIcons.cube,
                                                color: Colors.grey,
                                              ),
                                              hintStyle: customHintStyle(),
                                              isDense: true,
                                            )),
                                    suggestionsCallback: (pattern) async {
                                      return await getSuggestions(pattern);
                                    },
                                    itemBuilder: (context, suggestion) {
                                      Product product =
                                          Product.fromMap(suggestion);
                                      return ListTile(
                                        leading: Icon(MdiIcons.cubeOutline),
                                        title: Text(product.name),
                                        subtitle: Text(product.description),
                                        trailing: Text(
                                            '\$ ${product.rate.toStringAsFixed(2)}'),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      selectedProduct =
                                          Product.fromMap(suggestion);
                                      _productNameController.text =
                                          selectedProduct.name;
                                      _descriptionController.text =
                                          selectedProduct.description;
                                      _quantityController.text = "1";
                                      _rateController.text = selectedProduct
                                          .rate
                                          .toStringAsFixed(2);
                                      _discountController.text = "0.0";
                                      _priceController.text = selectedProduct
                                          .rate
                                          .toStringAsFixed(2);
                                    },
                                    hideSuggestionsOnKeyboardHide: true,
                                    hideOnError: true,
                                  ),
                                ),
                                flex: 2,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _quantityController,
                                    style: customTextStyle(),
                                    cursorColor: Colors.black87,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    onChanged: (val) {
                                      calculatePrice().then((price) {
                                        _priceController.text =
                                            double.parse(price.toString())
                                                .roundToDouble()
                                                .toStringAsFixed(2);
                                      });
                                    },
                                    decoration: new InputDecoration(
                                      labelText: "Quantity",
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      icon: new Icon(
                                        MdiIcons.chartBarStacked,
                                        color: Colors.grey,
                                      ),
                                      hintStyle: customHintStyle(),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 224,
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
                                        controller: _descriptionController,
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.text,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Product Description",
                                          icon: Icon(Icons.description),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  key: _columnKey,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: TextFormField(
                                        controller: _rateController,
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        onChanged: (val) {
                                          calculatePrice().then((price) {
                                            _priceController.text =
                                                double.parse(price.toString())
                                                    .toStringAsFixed(2);
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        decoration: new InputDecoration(
                                          labelText: "Rate",
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          icon: new Icon(
                                            MdiIcons.chartBarStacked,
                                            color: Colors.grey,
                                          ),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
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
                                      child: TextFormField(
                                        controller: _discountController,
                                        style: customTextStyle(),
                                        onChanged: (val) {
                                          calculatePrice().then((price) {
                                            _priceController.text =
                                                double.parse(price.toString())
                                                    .toStringAsFixed(2);
                                          });
                                        },
                                        cursorColor: Colors.black87,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        autofocus: true,
                                        decoration: new InputDecoration(
                                          labelText: _discountModeIsPercentage
                                              ? "Percentage"
                                              : "Amount",
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          icon: IconButton(
                                            icon: Icon(
                                              _discountModeIsPercentage
                                                  ? MdiIcons.filePercent
                                                  : MdiIcons.cashRefund,
                                              color: Colors.grey,
                                              size: 18,
                                            ),
                                            onPressed: () {
                                              _discountModeIsPercentage =
                                                  !_discountModeIsPercentage;
                                              setState(() {});
                                            },
                                          ),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
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
                                      child: TextFormField(
                                        controller: _priceController,
                                        style: customTextStyle(),
                                        cursorColor: Colors.black87,
                                        enabled: false,
                                        onChanged: (val) {
                                          calculatePrice().then((price) {
                                            _priceController.text =
                                                double.parse(price.toString())
                                                    .toStringAsFixed(2);
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        decoration: new InputDecoration(
                                          labelText: "Price",
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          icon: new Icon(
                                            MdiIcons.cashUsdOutline,
                                            color: Colors.grey,
                                          ),
                                          hintStyle: customHintStyle(),
                                          isDense: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
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
                    width: 16,
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
                        "Save",
                        style: customButtonTextStyle(),
                      ),
                      onPressed: () {
                        refreshList(selectedProduct);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void showError(String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: AlertDialog(
              title: Text(
                "Error !",
                style: errorTitleTextStyle(),
              ),
              content: Text(message),
              contentTextStyle: estimateTextStyle(),
              actions: <Widget>[
                OutlineButton(
                  textColor: Colors.red,
                  child: Text("Close"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
      },
    );
  }

  void showSaving(String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            title: Text(
              "Saving Estimate",
              style: estimateTextStyle(),
            ),
            content: Text(message),
            contentTextStyle: estimateTextStyle(),
          ),
        );
      },
    );
    CreateEstimate();
  }

  Future getSuggestions(String pattern) async {
    if (pattern.isNotEmpty) {
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

  refreshList(product) {
    setState(() {
      _productList.add(product);
    });
    estimateTotalCalculation();
  }

  Future<double> calculatePrice() async {
    int quantity =
        _quantityController.text == null || _quantityController.text.isEmpty
            ? 0
            : int.parse(_quantityController.text);
    double rate = _rateController.text == null || _rateController.text.isEmpty
        ? 0
        : double.parse(_rateController.text);
    double discount =
        _discountController.text == null || _discountController.text.isEmpty
            ? 0
            : double.parse(_discountController.text);
    return _discountModeIsPercentage
        ? ((quantity * rate) * (1 - (discount / 100)))
        : ((quantity * rate) - discount);
  }

  Future estimateTotalCalculation() async {
    setState(() {
      double discount = _EstimateDiscountController.text.isEmpty
          ? 0
          : double.parse(_EstimateDiscountController.text);
      estimateBaseSubTotal = getCurrentBaseSubtotal();
      estimateDiscountTotal = _DiscountTypeSelectedValue == _DiscountType[1]
          ? (estimateBaseSubTotal / discount)
          : discount;
      estimateMainSubtotal = estimateBaseSubTotal - estimateDiscountTotal;
      estimateTaxTotal = (estimateMainSubtotal *
              (_TaxTypeSelectedValue == _TaxType[0] ? 8.25 : 0)) /
          100;
      estimateTotalAmount = estimateMainSubtotal - estimateTaxTotal;
    });
  }

  getCurrentBaseSubtotal() {
    double price = 0;
    for (Product product in _productList) {
      price += product.rate;
    }
    return price;
  }

  Future getGeneratedEstimate() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'CustomerId': widget.customer.Id,
      'UserId': widget.loggedInUser.UserGUID,
      'CompanyId': widget.loggedInUser.CompanyGUID,
    };

    var url = "http://api.rmrcloud.com/GenerateEstimate";
    var result = await http.post(url, headers: headers);
    if (result.statusCode == 200) {
      return json.decode(result.body)['Invoice']['InvoiceId'];
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      return "";
    }
  }

  Future CreateEstimate() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'EstimateId': estimateId,
      'DiscountAmount': estimateDiscountTotal.toStringAsFixed(2),
      'TotalAmount': estimateTotalAmount.toStringAsFixed(2),
      'Amount': estimateMainSubtotal.toStringAsFixed(2),
      'Tax': estimateTaxTotal.toStringAsFixed(2),
      'DueDate': nextDate,
      'CreatedDate': formattedDate,
      'CustomerId': widget.loggedInUser.UserGUID,
      'CompanyId': widget.loggedInUser.CompanyGUID,
    };

    Map<String, String> body = {};
    List<Map<String, String>> map = [];
    for (Product product in _productList) {
      map.add(product.toMap());
    }
    body['ListEstimate'] = map.toString();

    var url = "http://api.rmrcloud.com/CreateEstimate";
    var result = await http.post(url, headers: headers, body: body);
    if (result.statusCode == 200) {
      Navigator.of(context).pop();
      showMessage(context, "Estimate saved successfully", json.decode(result.body),
          Colors.green, Icons.check);
    } else {
      showMessage(context, "Network error!", json.decode(result.body),
          Colors.redAccent, Icons.warning);
      Navigator.of(context).pop();
    }
  }
}
