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
      color: Colors.blueGrey.shade800,
      fontFamily: "Monserrat Regular",
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle customTextStyle(){
  return new TextStyle(
      color: Colors.blueGrey.shade800,
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
      fontWeight: FontWeight.bold,
      fontSize: 18,
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

TextStyle fragmentTitleStyle(){
  return new TextStyle(
      color: Colors.black,
      fontFamily: "Monserrat",
      fontWeight: FontWeight.bold,
      fontSize: 32,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle cardTitleStyle(){
  return new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontStyle: FontStyle.normal,
      letterSpacing: 1
  );
}

TextStyle listTextStyle(){
  return new TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontStyle: FontStyle.normal,
  );
}

TextStyle estimateTextStyle(){
  return new TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontStyle: FontStyle.normal,
  );
}