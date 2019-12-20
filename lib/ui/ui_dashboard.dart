import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/side_nav.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/ui/fragment_add_basement_report.dart';
import 'package:flutter_grate_app/ui/fragment_add_customer.dart';
import 'package:flutter_grate_app/ui/fragment_change_password.dart';
import 'package:flutter_grate_app/ui/fragment_customer_details.dart';
import 'package:flutter_grate_app/ui/fragment_dashboard.dart';
import 'package:flutter_grate_app/ui/fragment_logout.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
      fragment = new CustomerDetailsFragment(login: widget.login, backToDashboard: _backToDashboard, customerID: "3271", goToBasementReport: _goToBasementInspectionReport,);
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

  _goToCustomerDetails(String id) {
    setState(() {
      fragment = CustomerDetailsFragment(
          backToDashboard: _backToDashboard,
          login: widget.login,
          customerID: id);
    });
  }

  @override
  void initState() {
    super.initState();
    fragment = new DashboardFragment(login: widget.login, goToCustomerDetails: _goToCustomerDetails,);
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
}
