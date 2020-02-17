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
                      "Choose your plan for "+widget.customer.FirstName+" "+widget.customer.LastName ,
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
              child: Column(
            children: <Widget>[
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
                          " /Crawl space Contractors are traoned and certified",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Table(
                      border: TableBorder.all(width: .5, color: Colors.black),
                      children: [
                        TableRow(children: [
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          TableCell(
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
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold),
                                    ))),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(1);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: widget.customer.RecommendedLevel.toInt()==1 ? Colors.blue.shade200 :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Ground Water Control",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(2);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        color: widget.customer.RecommendedLevel.toInt()==2 ? Colors.blue.shade200  :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Pump And Power Failur Backup Protection",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(3);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        color: widget.customer.RecommendedLevel.toInt()==3 ? Colors.blue.shade200 :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Full Parimeter Grate Drain System",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(4);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        color: widget.customer.RecommendedLevel.toInt()==4 ? Colors.blue.shade200  :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Full Wall Protecttion",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(5);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        color: widget.customer.RecommendedLevel.toInt()==5 ? Colors.blue.shade200  :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Moisture Control",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                          TableCell(
                              child: InkWell(
                                onTap: (){
                                  goToRecommendedLevelDetails(6);
                                },
                                child: Container(
                                    height: 460,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        color: widget.customer.RecommendedLevel.toInt()==6 ? Colors.blue.shade200  :Colors.white
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 10, right: 10),
                                          child: Text(
                                            "Maintainance And Unkeep",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                    //color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(24),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            )),
                                      ],
                                    )),
                              )),
                        ]),
                      ],
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  void goToRecommendedLevelDetails(index){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
          new RecommendedLevelDetails(
            loggedInUser: widget.loggedInUser,
            login: widget.login,
            index: index,
            customer: widget.customer,
            backToCustomerDetails:
            backToCustomerDetails,
          ),
        ));
  }
  void backToCustomerDetails(int id) {
    widget.backToCustomerDetails(widget.customer);
  }

  @override
  void initState() {
    selectedLevel=widget.selectedLevel;

  }
}
