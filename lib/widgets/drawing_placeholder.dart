import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/drawer/drawer_theme.dart';

class DrawingPlaceholder extends StatelessWidget {

  String url;

  DrawingPlaceholder({this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: url!=null ?CachedNetworkImage(
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
      ):Text(
        "Add Drawing",
        style: defaultTextStyle,
      ),
    );
  }
}
