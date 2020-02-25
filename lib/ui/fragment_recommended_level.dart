import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

import 'fragment_recommended_level_details.dart';

class RecommendedLevel extends StatefulWidget {
  final Login login;
  int selectedLevel = 3;
  final LoggedInUser loggedInUser;
  final CustomerDetails customer;
  final ValueChanged<CustomerDetails> backToCustomerDetails;

  RecommendedLevel(
      {Key key,
      this.login,
      this.loggedInUser,
      this.customer,
      this.backToCustomerDetails})
      : super(key: key);

  @override
  _RecommendedLevelState createState() => new _RecommendedLevelState();
}

class _RecommendedLevelState extends State<RecommendedLevel>
    with SingleTickerProviderStateMixin {
  int selectedLevel;

  updateRecommendedLevel(int level) {
    setState(() {
      widget.customer.RecommendedLevel = level.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 16, left: 32, right: 32),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomBackButton(
                  onTap: () => widget.backToCustomerDetails(widget.customer),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Recommended Level", style: fragmentTitleStyle()),
                    Text(
                      "Choose your plan for " +
                          widget.customer.FirstName +
                          " " +
                          widget.customer.LastName,
                      style: listTextStyleForRecommendedLevel(),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(1);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==1 ? BoxShadow(
                              color: Colors.red.shade200.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==1 ? 16 : 0,
                            child: Image.asset(
                              'images/level_1.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(2);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==2 ? BoxShadow(
                                color: Colors.green.shade200.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==2 ? 16 : 0,
                            child: Image.asset(
                              'images/level_2.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(3);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==3 ? BoxShadow(
                                color: Colors.lightBlue.shade200.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==3 ? 16 : 0,
                            child: Image.asset(
                              'images/level_3.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(4);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==4 ? BoxShadow(
                                color: Colors.blueAccent.shade100.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==4 ? 16 : 0,
                            child: Image.asset('images/level_4.png',
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(5);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==5 ? BoxShadow(
                                color: Colors.brown.shade400.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==5 ? 16 : 0,
                            child: Image.asset(
                              'images/level_5.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          goToRecommendedLevelDetails(6);
                        },
                        child: Container(
                          decoration: new BoxDecoration(boxShadow: [
                            widget.customer.RecommendedLevel==6 ? BoxShadow(
                                color: Colors.brown.shade700.withOpacity(.5),
                                blurRadius: 4,
                                spreadRadius: 2
                            ) :  BoxShadow(
                              color: Colors.transparent,
                            ),
                          ]),
                          child: Card(
                            elevation: widget.customer.RecommendedLevel==6 ? 16 : 0,
                            child: Image.asset('images/level_6.png',
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void goToRecommendedLevelDetails(index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => new RecommendedLevelDetails(
            loggedInUser: widget.loggedInUser,
            login: widget.login,
            index: index,
            customer: widget.customer,
            backToCustomerDetails: backToCustomerDetails,
          ),
        ));
  }

  void backToCustomerDetails(int id) {
    widget.backToCustomerDetails(widget.customer);
  }

  @override
  void initState() {
    selectedLevel = widget.selectedLevel;
  }
}
