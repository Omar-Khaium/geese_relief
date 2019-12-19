import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemCustomer extends StatelessWidget {
  double width;

  ShimmerItemCustomer(this.width);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 24,
          height: 24,
          child: Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white24,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
        SizedBox(width: 16,),
        SizedBox(
          width: width,
          height: 12,
          child: Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white24,
            child:
            ClipRRect(
              borderRadius: new BorderRadius.all(Radius.circular(4)),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
