// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraClass extends StatefulWidget{


  @override
  _CameraState createState()=> _CameraState();


}

class _CameraState  extends State<CameraClass>{


  File _imageFile;
  _openGallery() async{
    File pickFromGallery= (await ImagePicker.pickImage(source: ImageSource.gallery));
    setState(() {
      _imageFile=pickFromGallery;
    });

  }
  _openCamera() async{
    File pickFromGallery= (await ImagePicker.pickImage(source: ImageSource.camera));
    setState(() {
      _imageFile=pickFromGallery;
    });
  }

  Future<void> _showDialog(BuildContext context){
    return showDialog(context:context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Make A choice"),
        content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  child: Text("Gallery"),
                  onTap: (){
                    _openGallery();
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                    _openCamera();
                  },
                ),
              ),
            ],
          ),
        ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("No Image Selected"),
          RaisedButton(
            onPressed: (){_showDialog(context);},
            child: Text("Select Image"),
          ),
        ],
      ),
    );
  }


}

