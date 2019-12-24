import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/side_nav.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/fragment_add_basement_report.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_details.dart';
import 'package:flutter_grate_app/ui/fragment_dashboard.dart';
import 'package:flutter_grate_app/ui/fragment_logout.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class DashboardUI extends StatefulWidget {
  Login login;

  DashboardUI(this.login);

  @override
  _DashboardUIState createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  String username = "John Doe";
  Widget fragment;
  GlobalKey<SideNavUIState> _keySideNav = GlobalKey();

  _refresh(int index) {
    setState(() {
      switch (index) {
        case 0:
          fragment = new DashboardFragment(login: widget.login, goToCustomerDetails: _goToCustomerDetails);
          break;
        case 1:
          fragment = AddCustomerFragment(
            backToDashboard: _backToDashboard,
            login: widget.login,
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
      fragment = new DashboardFragment(login: widget.login, goToCustomerDetails: _goToCustomerDetails);
    });
  }

  _backToCustomerDetails(String customerID) {
    setState(() {
      fragment = new CustomerDetailsFragment(login: widget.login, backToDashboard: _backToDashboard, customerID: customerID, goToBasementReport: _goToBasementInspectionReport,);
    });
  }

  _goToBasementInspectionReport(String id) {
    setState(() {
      fragment = AddBasementReportFragment(
          login: widget.login,
          backToCustomerDetails: _backToCustomerDetails,
          customerID: id);
    });
  }

  _goToCustomerDetails(String customerID) {
    setState(() {
      fragment = new CustomerDetailsFragment(login: widget.login, backToDashboard: _backToDashboard, customerID: customerID, goToBasementReport: _goToBasementInspectionReport,);
    });
  }

  @override
  void initState() {
    super.initState();
    fragment = new DashboardFragment(login: widget.login, goToCustomerDetails: _goToCustomerDetails,);
    _setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SideNavUI(
                refreshEvent: _refresh,
                key: _keySideNav,
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
    );
  }

  _setup() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey.shade900,
          title: Text(
            "Making your apps ready",
            style: fragmentTitleStyle(),
          ),
          content: Text(
            "Please wait...",
            style: cardTitleStyle(),
          ),
        );
      },
    );

    _dismissDialog(){
      Navigator.of(context).pop();
    }

    Future getData() async {
      Map<String, String> headers = {
        'Authorization': widget.login.accessToken,
        'Username': '1',
        'PageSize': '10'
      };

      var url = "http://api.rmrcloud.com/GetUserByUserName";
      var result = await http.get(url, headers: headers);
      if (result.statusCode == 200) {
        return result;
      } else {
        showMessage(context, "Network error!", json.decode(result.body), Colors.redAccent, Icons.warning);
        return [];
      }
    }
  }
}
