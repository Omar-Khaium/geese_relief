import 'package:flutter/material.dart';

TextStyle customWelcomeStyle(Color color){
  return new TextStyle(
      color: color,
      fontFamily: "Monserrat",
      fontWeight: FontWeight.bold,
      fontSize: 42,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customInkWellTextStyle(){
  return new TextStyle(
      color: Colors.black,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customTextStyle(){
  return new TextStyle(
      color: Colors.black,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customTextFieldErrorStyle(){
  return new TextStyle(
      color: Colors.redAccent,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customButtonTextStyle(){
  return new TextStyle(
      color: Colors.white,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customHintStyle(){
  return new TextStyle(
      color: Colors.grey,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}