import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/ui/fragment_recommended_level_details.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/data.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

var cardAspectRatio = 1.00;
var widgetAspectRatio = cardAspectRatio * 1.15;

class _RecommendedLevelState extends State<RecommendedLevel>
    with SingleTickerProviderStateMixin {
  var currentPage = recommendations.length - 1.0;

  updateRecommendedLevel(int level) {
    setState(() {
      widget.customer.RecommendedLevel = level.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller =
    PageController(initialPage: recommendations.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Column(children: <Widget>[
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
              Text("Customer Details", style: fragmentTitleStyle()),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .75,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CardScrollWidget(currentPage,
                            widget.customer.RecommendedLevel.toInt()),
                        Positioned.fill(
                          child: PageView.builder(
                            itemCount: recommendations.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(),
                                onTap: () => Navigator.push(
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
                                    )),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void backToCustomerDetails(int id) {
    widget.backToCustomerDetails(widget.customer);
  }
}

class CardScrollWidget extends StatefulWidget {
  var currentPage;
  int selectedLevel;

  CardScrollWidget(this.currentPage, this.selectedLevel);

  @override
  _CardScrollWidgetState createState() => _CardScrollWidgetState();
}

class _CardScrollWidgetState extends State<CardScrollWidget> {
  var padding = 20.0;

  var verticalInset = 20.0;

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < recommendations.length; i++) {
          var delta = i - widget.currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new RecommendedLevelDetails(),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 16.0)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        recommendations[i],
                        Positioned(
                          right: 36,
                          top: 40,
                          child: i + 1 == widget.selectedLevel
                              ? Icon(
                            MdiIcons.checkDecagram,
                            size: 48,
                            color: Colors.green.shade200,
                          )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
