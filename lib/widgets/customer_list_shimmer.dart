import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/list_shimmer_item_multiline_customer.dart';

import 'list_shimmer_item_customer.dart';

class ShimmerDashboardFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [0, 1, 2, 3, 4, 5, 6, 7]
              .map(
                (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ShimmerItemCustomer(250),
                              SizedBox(
                                height: 8,
                              ),
                              ShimmerItemCustomer(125),
                              SizedBox(
                                height: 8,
                              ),
                              ShimmerItemCustomer(175),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ShimmerItemMultiLineCustomer(300),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                  ],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
