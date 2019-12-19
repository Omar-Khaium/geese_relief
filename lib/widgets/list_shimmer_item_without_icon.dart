import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemWithoutIcon extends StatelessWidget {
  double width;

  ShimmerItemWithoutIcon(this.width);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
