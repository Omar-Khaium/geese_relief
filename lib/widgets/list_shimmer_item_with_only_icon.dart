import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemWithOnlyIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 36,
          height: 36,
          child: Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white24,
            child:
            ClipRRect(
              borderRadius: new BorderRadius.all(Radius.circular(18)),
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
