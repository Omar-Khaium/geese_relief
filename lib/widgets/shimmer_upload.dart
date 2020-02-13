import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUploadIcon extends StatelessWidget {
  final double size;

  ShimmerUploadIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Shimmer.fromColors(
        baseColor: Colors.black45,
        highlightColor: Colors.white,
        child: Icon(Icons.cloud_upload, size: size,),
      ),
    );
  }
}
