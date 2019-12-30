import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                                      Icon(Icons.keyboard_arrow_down),
                                      Text("After 15 days"),
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
                    itemBuilder: (context, index) {}),
              ),
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1.0, color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add),
                          Text("Add Drawing"),
                        ],
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
            title: Container(
                color: Colors.white,
                child: Container(
                  width: 500,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Add Product/Service",
                          style:
                              new TextStyle(fontSize: 24, color: Colors.black),
                        ),
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
                                      border: Border.all(
                                          width: 1.0, color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  padding: EdgeInsets.all(8),
                                  child: TextField(
                                    style: customTextStyle(),
                                    cursorColor: Colors.black87,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Product Name",
                                      icon: Icon(MdiIcons.cube),
                                      hintStyle: customHintStyle(),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.grey.shade200,
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                                width: 1.0, color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        padding: EdgeInsets.all(8),
                                        child: TextField(
                                          style: customTextStyle(),
                                          cursorColor: Colors.black87,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Product Name",
                                            icon: Icon(MdiIcons.cube),
                                            hintStyle: customHintStyle(),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3,),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.grey.shade200,
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                                width: 1.0, color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        padding: EdgeInsets.all(8),
                                        child: TextField(
                                          style: customTextStyle(),
                                          cursorColor: Colors.black87,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Product Name",
                                            icon: Icon(MdiIcons.cube),
                                            hintStyle: customHintStyle(),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
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
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
