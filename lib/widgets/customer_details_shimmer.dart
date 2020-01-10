import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_multiline_customer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

import 'list_shimmer_item_customer.dart';
import 'list_shimmer_item_with_only_icon.dart';
import 'list_shimmer_item_without_icon.dart';

class ShimmerCustomerDetailsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Material(
              elevation: 4,
              child: Container(
                width: double.infinity,
                height: 220,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 128,
                            height: 128,
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white24,
                              child: ClipRRect(
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ShimmerItemWithoutIcon(300),
                              SizedBox(
                                height: 16,
                              ),
                              ShimmerItemCustomer(200),
                              SizedBox(
                                height: 8,
                              ),
                              ShimmerItemCustomer(150),
                              SizedBox(
                                height: 8,
                              ),
                              ShimmerItemMultiLineCustomer(250),
                            ],
                          )
                        ],
                      ),
                      ShimmerItemWithoutIcon(150),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 100,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white24,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 100,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white24,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 100,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      new BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white24,
                                  child: ClipRRect(
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [0, 1, 2, 3, 4, 5, 6]
                .map((_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ShimmerItemCustomer(100),
                                SizedBox(
                                  height: 8,
                                ),
                                ShimmerItemCustomer(300),
                                SizedBox(
                                  height: 8,
                                ),
                                ShimmerItemCustomer(200),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ShimmerItemCustomer(150),
                                SizedBox(
                                  height: 8,
                                ),
                                ShimmerItemCustomer(200),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                ShimmerItemWithOnlyIcon(),
                                SizedBox(
                                  width: 8,
                                ),
                                ShimmerItemWithOnlyIcon(),
                                SizedBox(
                                  width: 8,
                                ),
                                ShimmerItemWithOnlyIcon(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
