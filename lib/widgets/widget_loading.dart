import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Shimmer.fromColors(
        baseColor: Colors.white54,
        highlightColor: Colors.blueGrey.shade900,
        child: Image.asset("images/logo.png"),
      ),
    );
  }
}
