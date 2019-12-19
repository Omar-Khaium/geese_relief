import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/list_row_item.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddBasementReportFragment extends StatefulWidget {
  Login login;
  String customerID;
  ValueChanged<String> backToCustomerDetails;

  AddBasementReportFragment(
      {Key key, this.login, this.customerID, this.backToCustomerDetails})
      : super(key: key);

  @override
  _AddBasementReportFragmentState createState() =>
      _AddBasementReportFragmentState();
}

class _AddBasementReportFragmentState extends State<AddBasementReportFragment> {
  TextEditingController _OutsideRelativeHumidityController = new TextEditingController();
  var _CurrentOutsideConditionsOptions = ["Select One", "Sunny", "Dark"];
  int _CurrentOutsideConditionsSelection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _CurrentOutsideConditionsSelection = 0;
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
                  onTap: () => widget.backToCustomerDetails(widget.customerID),
                ),
                SizedBox(
                  width: 16,
                ),
                Text("Basement Inspection Report", style: fragmentTitleStyle()),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
/*--------------------_Customer and Company's Information---------------------*/
                Material(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.network(
                              "https://i.ytimg.com/vi/g3t6YDnGXAc/hqdefault.jpg",
                              width: 128,
                              height: 128,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListRowItem(
                                  icon: Icons.pin_drop,
                                  text: "address line\ncity, state zip",
                                ),
                                ListRowItem(
                                  icon: Icons.email,
                                  text: "example@mail.com",
                                ),
                                ListRowItem(
                                  icon: Icons.phone,
                                  text: "018XXXXXXXX",
                                ),
                                ListRowItem(
                                  icon: MdiIcons.fax,
                                  text: "XXXX XXXX",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListRowItem(
                              icon: Icons.event,
                              text: "11/22/2019",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ListRowItem(
                              icon: Icons.person,
                              text: "Name",
                            ),
                            ListRowItem(
                              icon: Icons.pin_drop,
                              text: "address line\ncity, state zip",
                            ),
                            ListRowItem(
                              icon: Icons.phone,
                              text: "018XXXXXXXX",
                            ),
                            ListRowItem(
                              icon: Icons.email,
                              text: "example@mail.com",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
/*------------------RELATIVE HUMIDITY / TEMPERATURE READINGS------------------*/
                Material(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Relative Humidity / Temperature Readings",
                          style: cardTitleStyle(),
                        ),
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          child: Divider(
                            color: Colors.grey,
                            thickness: .5,
                          ),
                        ),

                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _CurrentOutsideConditionsSelection==0 ? "Select another value" : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Current Outside Conditions*",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(
                              _CurrentOutsideConditionsOptions.length,
                                  (index) {
                                return DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                      _CurrentOutsideConditionsOptions[
                                      index]));
                              }),
                          onChanged: (index) {
                            setState(() {
                              _CurrentOutsideConditionsSelection = index;
                            });
                          },
                          value: _CurrentOutsideConditionsSelection,
                        ),

                        new TextField(
                          controller: _OutsideRelativeHumidityController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _OutsideRelativeHumidityController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Outside Relative Humidity *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
