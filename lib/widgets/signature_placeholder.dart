import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignaturePlaceholder extends StatelessWidget {

  String url;

  SignaturePlaceholder({this.url});


  @override
  Widget build(BuildContext context) {
    return url!=null ?CachedNetworkImage(
      imageUrl: url,
      imageBuilder:
          (context,
          imageProvider) =>
          Container(
            decoration:
            BoxDecoration(
              image: DecorationImage(
                image:
                imageProvider,
                fit: BoxFit.cover,),
            ),
          ),
      placeholder:
          (context,
          url) =>
          CupertinoActivityIndicator(),
      errorWidget: (context,
          url,
          error) =>
          Icon(Icons
              .error),
    ):Container(
      color:
      Colors.grey.shade200,
      child: Center(
        child: Text("Tap To Sign"),
      ),
    );
  }
}
