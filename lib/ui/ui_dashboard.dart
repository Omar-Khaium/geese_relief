import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/side_nav.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/db_helper.dart';
import 'package:flutter_grate_app/sqflite/model/BasementReport.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/fragment_add_basement_report.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_add_estimate.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_details.dart';
import 'package:flutter_grate_app/ui/fragment_dashboard.dart';
import 'package:flutter_grate_app/ui/fragment_logout.dart';
import 'package:flutter_grate_app/ui/fragment_update_basement_report.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../utils.dart';
import 'fragment_recommended_level.dart';
import 'fragment_update_estimate.dart';

class DashboardUI extends StatefulWidget {
  Login login;
  LoggedInUser loggedInUser;


  DashboardUI(this.login, this.loggedInUser);

  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  Widget fragment;
  GlobalKey<SideNavUIState> _keySideNav = GlobalKey();
  DBHelper dbHelper = new DBHelper();
  LoggedInUser loggedInUser;

  _refresh(int index) {
    setState(() {
      switch (index) {
        case 0:
          fragment = new DashboardFragment(
              login: widget.login, goToCustomerDetails: _goToCustomerDetails,loggedInUser: widget.loggedInUser,);
          break;
        case 1:
          fragment = AddCustomerFragment(
            backToDashboard: _backToDashboard,
            login: widget.login,
            isLoading: _showLoading,
            loggedInUser: widget.loggedInUser,
          );
          break;
        case 2:
          fragment = ChangePasswordFragment(
            backToDashboard: _backToDashboard,
            login: widget.login,
          );
          break;
        case 3:
          fragment = LogoutFragment(
            showLoading: _showLoading,
            backToDashboard: _backToDashboard,
            login: widget.login,
          );
          break;
      }
    });
  }

  _showLoading(bool flag) {
    setState(() {
      _isLoading = flag;
    });
  }

  _backToDashboard(int value) {
    setState(() {
      _keySideNav.currentState.updateSelection(value);
      fragment = new DashboardFragment(
          login: widget.login, goToCustomerDetails: _goToCustomerDetails, loggedInUser: widget.loggedInUser,);
    });
  }

  _backToCustomerDetails(CustomerDetails customer) {
    setState(() {
      fragment = new CustomerDetailsFragment(login: widget.login,
        loggedInUser: widget.loggedInUser,
        backToDashboard: _backToDashboard,
        customerID: customer.Id,
        customer: customer,
        goToAddEstimate: _goToAddEstimate,
        goToRecommendedLevel: _goToAddRecommendedLevel,
        goToUpdateEstimate: _goToUpdateEstimate,
        goToUpdateBasementReport: _goToUpdateBasementInspectionReport,
        goToAddBasementReport: _goToBasementInspectionReport,);
    });
  }

  _goToAddEstimate(CustomerDetails customer) {
    setState(() {
      fragment = AddEstimateFragment(
          login: widget.login,
          loggedInUser: widget.loggedInUser,
          backToCustomerDetailsFromEstimate: _backToCustomerDetailsFromEstimate,
          customer: customer);
    });
  }

  _goToUpdateEstimate(CustomerDetails customer) {
    setState(() {
      fragment = UpdateEstimateFragment(
          login: widget.login,
          loggedInUser: widget.loggedInUser,
          backToCustomerDetailsFromEstimate: _backToCustomerDetailsFromEstimate,
          customer: customer);
    });
  }

  _backToCustomerDetailsFromEstimate(CustomerDetails customer) {
    setState(() {
      fragment = new CustomerDetailsFragment(login: widget.login,
        backToDashboard: _backToDashboard,
        customer: customer,
        customerID: customer.Id,
        goToAddEstimate: _goToAddEstimate,
        goToUpdateEstimate: _goToUpdateEstimate,
        goToAddBasementReport: _goToBasementInspectionReport,
        goToUpdateBasementReport: _goToUpdateBasementInspectionReport,);
    });
  }

  _goToBasementInspectionReport(CustomerDetails customer) {
    setState(() {
      fragment = AddBasementReportFragment(
          login: widget.login,
          loggedInUser: widget.loggedInUser,
          backToCustomerDetails: _backToCustomerDetails,
          customer: customer);
    });
  }

  _goToUpdateBasementInspectionReport(CustomerDetails customer) {
    setState(() {
      fragment = UpdateBasementReportFragment(
          login: widget.login,
          loggedInUser: widget.loggedInUser,
          backToCustomerDetails: _backToCustomerDetails,
          customer: customer);
    });
  }

  _goToAddRecommendedLevel(CustomerDetails customer) {
    setState(() {
      fragment = RecommendedLevel(
          login: widget.login,
          loggedInUser: widget.loggedInUser,
          backToCustomerDetails: _backToCustomerDetails,
          customer: customer);
    });
  }

  _goToCustomerDetails(String customerID) {
    setState(() {
      fragment = new CustomerDetailsFragment(login: widget.login,
        backToDashboard: _backToDashboard,
        customerID: customerID,
        goToAddBasementReport: _goToBasementInspectionReport,
        goToUpdateBasementReport: _goToUpdateBasementInspectionReport,
        goToAddEstimate: _goToAddEstimate,
        goToUpdateEstimate: _goToUpdateEstimate,
        goToRecommendedLevel: _goToAddRecommendedLevel,
      loggedInUser: widget.loggedInUser,);
    });
  }

  @override
  void initState() {
    super.initState();
    fragment = new DashboardFragment(login: widget.login, goToCustomerDetails: _goToCustomerDetails,
    loggedInUser: widget.loggedInUser,);
     _checkBasementData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: (){},
        child: ModalProgressHUD(
          child: SafeArea(
            child: Row(
              children: <Widget>[
                SideNavUI(
                  refreshEvent: _refresh,
                  key: _keySideNav,
                  login: widget.login,
                  loggedInUser: widget.loggedInUser,
                ),
                Expanded(
                  child: fragment,
                ),
              ],
            ),
          ),
          inAsyncCall: _isLoading,
          color: Colors.black,
          progressIndicator: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
          dismissible: false,
        ),
      ),
    );
  }

  void _checkBasementData() async {
    List<BasementReport> basementsDatas=await dbHelper.getBasementData();
    if(basementsDatas.isNotEmpty && basementsDatas.length!=0){
      showPopup(basementsDatas[0].header);
    }
    else{

    }
  }
  void showPopup( String header){
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Container(
              width: 600,
              height: 600,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Image.asset('images/no_internet.gif',fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            width:MediaQuery.of(context).size.width,
                            height: 64,
                            child: OutlineButton(
                              highlightElevation: 2,
                              color: Colors.black,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "No,Thanks",
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
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width:MediaQuery.of(context).size.width,
                            height: 64,
                            child: RaisedButton(
                              highlightElevation: 2,
                              disabledColor: Colors.black,
                              color: Colors.black,
                              elevation: 2,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Sync",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Roboto"),
                              ),
                              onPressed: () {
                                _syncBaseData(header);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
  _syncBaseData(String header) async{
    bool result= await saveInspectionReport(header,context, widget.login);
  }
}
