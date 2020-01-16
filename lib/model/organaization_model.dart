
import 'package:flutter/cupertino.dart';

class Organization{

  Icon image;
  String text;

  Organization(this.image, this.text);

  Organization.fromMap(Map<String,dynamic> map){
    image=map['image'];
    text=map['text'].toString();

  }
}