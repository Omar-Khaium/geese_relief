import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/data.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
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
          SizedBox(
            height: 24,
          ),
          Expanded(
              child:
              Container(
                margin: EdgeInsets.only(top: 24, left: 0, right: 0),
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Step towards a " +
                          widget.loggedInUser.CompanyName +
                          " and a nationally backend warranty",
                      style: listTextStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "All of our  " +
                          widget.loggedInUser.CompanyName +
                          " /Crawl space Contractors are trained and certified",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Table(
                        border: TableBorder.all(width: .5, color: Colors.black),
                        children: [
                          TableRow(children: [
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color:  widget.customer.RecommendedLevel
                                      .toInt() ==
                                      1
                                      ?
                                  Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level One",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  1
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  widget.customer.RecommendedLevel
                                        .toInt() ==
                                        2
                                        ?
                                    Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level Two",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  2
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  widget.customer.RecommendedLevel
                                        .toInt() ==
                                        3
                                        ?
                                    Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level Three",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  3
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  widget.customer.RecommendedLevel
                                        .toInt() ==
                                        4
                                        ?
                                    Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level Four",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  4
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  widget.customer.RecommendedLevel
                                        .toInt() ==
                                        5
                                        ?
                                    Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level Five",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  5
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  widget.customer.RecommendedLevel
                                        .toInt() ==
                                        6
                                        ?
                                    Color(0xFF182848) : Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Level Six",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead
                                              .copyWith(
                                              color: widget.customer.RecommendedLevel
                                                  .toInt() ==
                                                  6
                                                  ? Colors.white : Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(1);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              1
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_1.png',fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width,),
                                      ),),
                                )),
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(2);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              2
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_2.png',fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width),
                                      ),),
                                )),
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(3);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              3
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_3.png',fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width),
                                      ),),
                                )),
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(4);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              4
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_4.png',fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width),
                                      ),),
                                )),
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(5);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              5
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_5.png',fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width),
                                      ),),
                                )),
                            TableCell(
                                child: InkWell(
                                  onTap: () {
                                    goToRecommendedLevelDetails(6);
                                  },
                                  child: Container(
                                      height: MediaQuery.of(context).size.height-284,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                          gradient: widget.customer.RecommendedLevel
                                              .toInt() ==
                                              6
                                              ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF182848),
                                                Color(0xFF182848),
                                              ])
                                              : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ])),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset('images/level_6.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                                      ),),
                                )),
                          ]),
                        ],
                      ),
                    )
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
