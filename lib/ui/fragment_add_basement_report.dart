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
  TextEditingController _OutsideRelativeHumidityController =
      new TextEditingController();
  TextEditingController _OutsideTemperatureController =
      new TextEditingController();
  TextEditingController _1stFloorRelativeHumidityController =
      new TextEditingController();
  TextEditingController _1stFloorTemperatureController =
      new TextEditingController();
  TextEditingController _BasementRelativeHumidityController =
      new TextEditingController();
  TextEditingController _BasementTemperatureController =
      new TextEditingController();
  TextEditingController _Other1Controller = new TextEditingController();
  TextEditingController _Other2Controller = new TextEditingController();
  TextEditingController _VisualBasementInspectionOtherController =
      new TextEditingController();
  TextEditingController _NoticedSmellsCommentController =
      new TextEditingController();
  TextEditingController _NoticedMoldsCommentController =
      new TextEditingController();
  TextEditingController _SufferFromRespiratoryCommentController =
      new TextEditingController();
  TextEditingController _ChildrenPlayInTheBasementCommentController =
      new TextEditingController();
  TextEditingController _HavePetsCommentController =
      new TextEditingController();
  TextEditingController _NoticedBugsCommentController =
      new TextEditingController();
  TextEditingController _GetWaterCommentController =
      new TextEditingController();
  TextEditingController _EverSeePipesDrippingCommentController =
      new TextEditingController();
  TextEditingController _AnyRepairsToTryAndFixCommentController =
      new TextEditingController();
  TextEditingController _PlanOnLivingOrSellCommentController =
      new TextEditingController();
  TextEditingController _TestedForRadonInThePast2YearsCommentController =
      new TextEditingController();

  var _CurrentOutsideConditionsOptions = ["Select One", "Sunny", "Dark"];
  var _HeatOptions = ["Select One", "Hot Water", "Cold Water"];
  var _AirOptions = ["Select One", "Central", "Outer", "One Side"];
  var _BasementDehumidifierOptions = [
    "Select One",
    "Yes 40 pint",
    "Yes 50 pint",
    "Yes 60 pint"
  ];
  var _YesNoOptions = ["Select One", "Yes", "No"];
  var _LosePowerOption = ["Select One", "Rarely", "Often"];
  var _PlansForTheBasementOnceItsDryOptions = [
    "Select One",
    "Storage",
    "Wastage"
  ];
  var _RatingOptions = [
    "Select One",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  int _CurrentOutsideConditionsSelection;
  int _HeatSelection;
  int _AirSelection;
  int _BasementDehumidifierSelection;
  int _GroundWaterSelection;
  int _GroundWaterRatingSelection;
  int _IronBacteriaSelection;
  int _IronBacteriaRatingSelection;
  int _CondensationSelection;
  int _CondensationRatingSelection;
  int _WallCracksSelection;
  int _WallCracksRatingSelection;
  int _FloorCracksSelection;
  int _FloorCracksRatingSelection;
  int _ExistingSumpPumpSelection;
  int _ExistingDrainageSystemSelection;
  int _RadonSystemSelection;
  int _DryerVentToCodeSelection;
  int _FoundationTypeSelection;
  int _BulkheadTypeSelection;
  int _NoticedSmellsSelection;
  int _NoticedMoldSelection;
  int _OftenDoYouGoDownSelection;
  int _SufferFromRespiratorySelection;
  int _ChildrenPlayInTheBasementSelection;
  int _HavePetsCommentSelection;
  int _NoticedBugsSelection;
  int _GetWaterSelection;
  int _RemoveWaterFromBasementSelection;
  int _EverSeePipesDrippingSelection;
  int _AnyRepairsToTryAndFixSelection;
  int _PlanOnLivingOrSellSelection;
  int _PlansForTheBasementOnceItsDrySelection;
  int _TestedForRadonInThePast2YearsSelection;
  int _LosePowerSelection;
  int _LosePowerHowOftenSelection;

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
              children: <Widget>[
/*--------------------_Customer and Company's Information---------------------*/
                Card(
                  elevation: 2,
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
                  height: 8,
                ),
/*------------------RELATIVE HUMIDITY / TEMPERATURE READINGS------------------*/
                Card(
                  elevation: 2,
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
                              errorText: _CurrentOutsideConditionsSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Current Outside Conditions*",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(
                              _CurrentOutsideConditionsOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(
                                    _CurrentOutsideConditionsOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _CurrentOutsideConditionsSelection = index;
                            });
                          },
                          value: _CurrentOutsideConditionsSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _OutsideRelativeHumidityController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
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
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _OutsideTemperatureController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _OutsideTemperatureController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Outside Temperature *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _1stFloorRelativeHumidityController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              labelText: "1st Floor Relative Humidity",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _1stFloorTemperatureController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              labelText: "1st Floor Temperature",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Current Inside Condition",
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
                                      errorText: _HeatSelection == 0
                                          ? "Select another value"
                                          : null,
                                      errorStyle: customTextFieldErrorStyle(),
                                      labelText: "Heat*",
                                      labelStyle: customTextStyle(),
                                      hintText: "e.g. hint",
                                      hintStyle: customHintStyle(),
                                      alignLabelWithHint: false,
                                      isDense: true),
                                  items: List.generate(_HeatOptions.length,
                                      (index) {
                                    return DropdownMenuItem(
                                        value: index,
                                        child: Text(_HeatOptions[index]));
                                  }),
                                  onChanged: (index) {
                                    setState(() {
                                      _HeatSelection = index;
                                    });
                                  },
                                  value: _HeatSelection,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField(
                                  decoration: new InputDecoration(
                                      errorText: _AirSelection == 0
                                          ? "Select another value"
                                          : null,
                                      errorStyle: customTextFieldErrorStyle(),
                                      labelText: "Air *",
                                      labelStyle: customTextStyle(),
                                      hintText: "e.g. hint",
                                      hintStyle: customHintStyle(),
                                      alignLabelWithHint: false,
                                      isDense: true),
                                  items: List.generate(_AirOptions.length,
                                      (index) {
                                    return DropdownMenuItem(
                                        value: index,
                                        child: Text(_AirOptions[index]));
                                  }),
                                  onChanged: (index) {
                                    setState(() {
                                      _AirSelection = index;
                                    });
                                  },
                                  value: _AirSelection,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                new TextField(
                                  controller:
                                      _BasementRelativeHumidityController,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: false, signed: false),
                                  maxLines: 1,
                                  style: customTextStyle(),
                                  decoration: new InputDecoration(
                                      labelText: "Basement Relative Humidity *",
                                      labelStyle: customTextStyle(),
                                      hintText: "e.g. hint",
                                      hintStyle: customHintStyle(),
                                      alignLabelWithHint: false,
                                      isDense: true),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                new TextField(
                                  controller: _BasementTemperatureController,
                                  obscureText: false,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: false, signed: false),
                                  maxLines: 1,
                                  style: customTextStyle(),
                                  decoration: new InputDecoration(
                                      labelText: "Basement Temperature",
                                      labelStyle: customTextStyle(),
                                      hintText: "e.g. hint",
                                      hintStyle: customHintStyle(),
                                      alignLabelWithHint: false,
                                      isDense: true),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                DropdownButtonFormField(
                                  decoration: new InputDecoration(
                                      errorText:
                                          _BasementDehumidifierSelection == 0
                                              ? "Select another value"
                                              : null,
                                      errorStyle: customTextFieldErrorStyle(),
                                      labelText: "Air *",
                                      labelStyle: customTextStyle(),
                                      hintText: "e.g. hint",
                                      hintStyle: customHintStyle(),
                                      alignLabelWithHint: false,
                                      isDense: true),
                                  items: List.generate(
                                      _BasementDehumidifierOptions.length,
                                      (index) {
                                    return DropdownMenuItem(
                                        value: index,
                                        child: Text(
                                            _BasementDehumidifierOptions[
                                                index]));
                                  }),
                                  onChanged: (index) {
                                    setState(() {
                                      _BasementDehumidifierSelection = index;
                                    });
                                  },
                                  value: _BasementDehumidifierSelection,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        new TextField(
                          controller: _Other1Controller,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              labelText: "Other",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _Other2Controller,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              labelText: "Other",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
/*------------------VISUAL BASEMENT INSPECTION------------------*/
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Visual Basement Inspection",
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
                              errorText: _GroundWaterSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Ground Water *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _GroundWaterSelection = index;
                            });
                          },
                          value: _GroundWaterSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText: "Ground Water Rating (1-10)",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_RatingOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_RatingOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _GroundWaterRatingSelection = index;
                            });
                          },
                          value: _GroundWaterRatingSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _IronBacteriaSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Iron Bacteria *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _IronBacteriaSelection = index;
                            });
                          },
                          value: _IronBacteriaSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText: "Iron Bacteria Rating (1-10)",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_RatingOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_RatingOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _IronBacteriaRatingSelection = index;
                            });
                          },
                          value: _IronBacteriaRatingSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _CondensationSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Condensation *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _CondensationSelection = index;
                            });
                          },
                          value: _CondensationSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText: "Condensation Rating (1-10)",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_RatingOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_RatingOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _CondensationRatingSelection = index;
                            });
                          },
                          value: _CondensationRatingSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _WallCracksSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Wall Cracks *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _WallCracksSelection = index;
                            });
                          },
                          value: _WallCracksSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText: "Wall Cracks Rating (1-10)",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_RatingOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_RatingOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _WallCracksRatingSelection = index;
                            });
                          },
                          value: _WallCracksRatingSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _FloorCracksSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Floor Cracks *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _FloorCracksSelection = index;
                            });
                          },
                          value: _FloorCracksSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText: "Floor Cracks Rating (1-10)",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_RatingOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_RatingOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _FloorCracksRatingSelection = index;
                            });
                          },
                          value: _FloorCracksRatingSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _ExistingSumpPumpSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Existing Sump Pump *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _ExistingSumpPumpSelection = index;
                            });
                          },
                          value: _ExistingSumpPumpSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _ExistingDrainageSystemSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Existing Drainage System *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _ExistingDrainageSystemSelection = index;
                            });
                          },
                          value: _ExistingDrainageSystemSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _RadonSystemSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Radon System (existing) *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _RadonSystemSelection = index;
                            });
                          },
                          value: _RadonSystemSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _DryerVentToCodeSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Dryer Vent To Code? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _DryerVentToCodeSelection = index;
                            });
                          },
                          value: _DryerVentToCodeSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _FoundationTypeSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Foundation Type? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _FoundationTypeSelection = index;
                            });
                          },
                          value: _FoundationTypeSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _BulkheadTypeSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "Bulkhead ? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _BulkheadTypeSelection = index;
                            });
                          },
                          value: _BulkheadTypeSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        new TextField(
                          controller: _VisualBasementInspectionOtherController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              labelText: "Other",
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
                SizedBox(
                  height: 8,
                ),
/*------------------CUSTOMER BASEMENT EVALUATION------------------*/
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Customer Basement Evaluation",
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
                              errorText: _NoticedSmellsSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "1. Have you ever noticed smells/odors coming from the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _NoticedSmellsSelection = index;
                            });
                          },
                          value: _NoticedSmellsSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _NoticedSmellsCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _NoticedSmellsCommentController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "1. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _NoticedMoldSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "2. Have you ever noticed mold/mildew on any item in the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _NoticedMoldSelection = index;
                            });
                          },
                          value: _NoticedMoldSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _NoticedMoldsCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _NoticedMoldsCommentController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "2. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _OftenDoYouGoDownSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "3. How often do you go down in the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _OftenDoYouGoDownSelection = index;
                            });
                          },
                          value: _OftenDoYouGoDownSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _SufferFromRespiratorySelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "4. Does anyone in the home suffer from respiratory problems? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _SufferFromRespiratorySelection = index;
                            });
                          },
                          value: _SufferFromRespiratorySelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _SufferFromRespiratoryCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _SufferFromRespiratoryCommentController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "4. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText:
                                  _ChildrenPlayInTheBasementSelection == 0
                                      ? "Select another value"
                                      : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "5. Do your children play in the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _ChildrenPlayInTheBasementSelection = index;
                            });
                          },
                          value: _ChildrenPlayInTheBasementSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller:
                              _ChildrenPlayInTheBasementCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _ChildrenPlayInTheBasementCommentController
                                          .text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "5. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _HavePetsCommentSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "6. Do you have pets that go in the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _HavePetsCommentSelection = index;
                            });
                          },
                          value: _HavePetsCommentSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _HavePetsCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _HavePetsCommentController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "6. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _NoticedBugsSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "7. Have you ever noticed bugs/rodents in the basement? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _NoticedBugsSelection = index;
                            });
                          },
                          value: _NoticedBugsSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _NoticedBugsCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _NoticedBugsCommentController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "7. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _GetWaterSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "8. Do you get water?* How high does the water level get?",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _GetWaterSelection = index;
                            });
                          },
                          value: _GetWaterSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _GetWaterCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _GetWaterCommentController.text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "8. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText:
                                  "9. How do you normally remove the water from basement?",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _RemoveWaterFromBasementSelection = index;
                            });
                          },
                          value: _RemoveWaterFromBasementSelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _EverSeePipesDrippingSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "10. Do you ever see pipes dripping (condensation)? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _EverSeePipesDrippingSelection = index;
                            });
                          },
                          value: _EverSeePipesDrippingSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _EverSeePipesDrippingCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _EverSeePipesDrippingCommentController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "10. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _AnyRepairsToTryAndFixSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "11. Have you done any repairs to try and fix these problems? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _AnyRepairsToTryAndFixSelection = index;
                            });
                          },
                          value: _AnyRepairsToTryAndFixSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _AnyRepairsToTryAndFixCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _AnyRepairsToTryAndFixCommentController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "11. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText: _PlanOnLivingOrSellSelection == 0
                                  ? "Select another value"
                                  : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "12. How long do you plan on living here?* Are you planning to sell*",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _PlanOnLivingOrSellSelection = index;
                            });
                          },
                          value: _PlanOnLivingOrSellSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller: _PlanOnLivingOrSellCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText: _PlanOnLivingOrSellCommentController
                                      .text.isNotEmpty
                                  ? null
                                  : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "12. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              labelText:
                                  "13. What are your plans for the basement once it is dry?",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(
                              _PlansForTheBasementOnceItsDryOptions.length,
                              (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(
                                    _PlansForTheBasementOnceItsDryOptions[
                                        index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _PlansForTheBasementOnceItsDrySelection = index;
                            });
                          },
                          value: _PlansForTheBasementOnceItsDrySelection,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: new InputDecoration(
                              errorText:
                                  _TestedForRadonInThePast2YearsSelection == 0
                                      ? "Select another value"
                                      : null,
                              errorStyle: customTextFieldErrorStyle(),
                              labelText:
                                  "14. Has your home been tested for radon in the past 2 years? *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                          items: List.generate(_YesNoOptions.length, (index) {
                            return DropdownMenuItem(
                                value: index,
                                child: Text(_YesNoOptions[index]));
                          }),
                          onChanged: (index) {
                            setState(() {
                              _TestedForRadonInThePast2YearsSelection = index;
                            });
                          },
                          value: _TestedForRadonInThePast2YearsSelection,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        new TextField(
                          controller:
                              _TestedForRadonInThePast2YearsCommentController,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {});
                          },
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: customTextStyle(),
                          decoration: new InputDecoration(
                              errorText:
                                  _TestedForRadonInThePast2YearsCommentController
                                          .text.isNotEmpty
                                      ? null
                                      : "* Required",
                              errorStyle: customTextFieldErrorStyle(),
                              labelText: "14. Comment *",
                              labelStyle: customTextStyle(),
                              hintText: "e.g. hint",
                              hintStyle: customHintStyle(),
                              alignLabelWithHint: false,
                              isDense: true),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                    errorText: _LosePowerSelection == 0
                                        ? "Select another value"
                                        : null,
                                    errorStyle: customTextFieldErrorStyle(),
                                    labelText: "15. Do you lose power? *",
                                    labelStyle: customTextStyle(),
                                    hintText: "e.g. hint",
                                    hintStyle: customHintStyle(),
                                    alignLabelWithHint: false,
                                    isDense: true),
                                items: List.generate(_YesNoOptions.length,
                                    (index) {
                                  return DropdownMenuItem(
                                      value: index,
                                      child: Text(_YesNoOptions[index]));
                                }),
                                onChanged: (index) {
                                  setState(() {
                                    _LosePowerSelection = index;
                                  });
                                },
                                value: _LosePowerSelection,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: new InputDecoration(
                                    errorText: _LosePowerHowOftenSelection == 0
                                        ? "Select another value"
                                        : null,
                                    errorStyle: customTextFieldErrorStyle(),
                                    labelText: "If so how often? *",
                                    labelStyle: customTextStyle(),
                                    hintText: "e.g. hint",
                                    hintStyle: customHintStyle(),
                                    alignLabelWithHint: false,
                                    isDense: true),
                                items: List.generate(_LosePowerOption.length,
                                    (index) {
                                  return DropdownMenuItem(
                                      value: index,
                                      child: Text(_LosePowerOption[index]));
                                }),
                                onChanged: (index) {
                                  setState(() {
                                    _LosePowerHowOftenSelection = index;
                                  });
                                },
                                value: _LosePowerHowOftenSelection,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
