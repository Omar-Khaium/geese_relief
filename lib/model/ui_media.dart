import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geese_relief/model/media_file.dart';

import 'customer.dart';

class MediaUI extends StatelessWidget {
  final Customer customer;

  MediaUI(this.customer);

  final List<MediaFile> files = [
    MediaFile("Good Fon", "https://img4.goodfon.com/wallpaper/nbig/6/f4/ptitsa-gus-fon.jpg", "04/15/2020"),
    MediaFile("Canadian geese ducks", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbqAYGS33uXAd29Jpr37IQekrereYrM4BGFKz9IJNoZTmgEU_a&usqp=CAU", "04/14/2020"),
    MediaFile("Goose Window 7", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQecs0BvLZBlBVPqs5eDH2c7ah1Mcb-pd74z58Y7mWkBcPs2P1V&usqp=CAU", "04/14/2020"),
    MediaFile("Goose Face", "https://wallup.net/wp-content/uploads/2018/10/04/136493-duck-goose-geese-face-funny-748x561.jpg", "04/14/2020"),
    MediaFile("Mallard Bird", "https://c4.wallpaperflare.com/wallpaper/212/423/765/red-leaf-plant-selective-photography-wallpaper-preview.jpg", "04/14/2020"),
    MediaFile("Barbara Gesse", "https://wallup.net/wp-content/uploads/2018/10/07/996679-geese-street-lights-two-animals-wallpapers-748x499.jpg", "04/12/2020"),
    MediaFile("Good Fon", "https://img4.goodfon.com/wallpaper/nbig/6/f4/ptitsa-gus-fon.jpg", "04/15/2020"),
    MediaFile("Canadian geese ducks", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbqAYGS33uXAd29Jpr37IQekrereYrM4BGFKz9IJNoZTmgEU_a&usqp=CAU", "04/14/2020"),
    MediaFile("Goose Window 7", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQecs0BvLZBlBVPqs5eDH2c7ah1Mcb-pd74z58Y7mWkBcPs2P1V&usqp=CAU", "04/14/2020"),
    MediaFile("Goose Face", "https://wallup.net/wp-content/uploads/2018/10/04/136493-duck-goose-geese-face-funny-748x561.jpg", "04/14/2020"),
    MediaFile("Mallard Bird", "https://c4.wallpaperflare.com/wallpaper/212/423/765/red-leaf-plant-selective-photography-wallpaper-preview.jpg", "04/14/2020"),
    MediaFile("Barbara Gesse", "https://wallup.net/wp-content/uploads/2018/10/07/996679-geese-street-lights-two-animals-wallpapers-748x499.jpg", "04/12/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.all(16),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: files.length,
          itemBuilder: (BuildContext context, int index) {
            MediaFile media = files[index];
            return Card(
              elevation: 2,
              color: Colors.white,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network(
                    media.url,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                      title: Text(media.name, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),),
                      subtitle: Text(media.date, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),),
                    ),
                  )
                ],
              ),
            );
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      ),
    );
  }
}
