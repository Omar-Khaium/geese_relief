import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  final onTap;

  CustomBackButton({this.onTap});

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_back,color: Colors.white,),
      ),
    );
  }
}
