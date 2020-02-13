import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

class PlaceImageFromPicture extends StatelessWidget {
  PictureDetails _picture;

  PlaceImageFromPicture(this._picture);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder(
        future: _picture.toPNG(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(child: Image.memory(snapshot.data, fit: BoxFit.fill,),);
              }
              break;
            default:
              return CupertinoTheme(data: CupertinoTheme.of(context).copyWith(brightness: Brightness.dark), child: CupertinoActivityIndicator(),);
          }
        },
      ),
    );
  }
}
