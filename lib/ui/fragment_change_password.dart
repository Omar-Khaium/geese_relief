import 'package:flutter/material.dart';

class ChangePasswordFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: new Column(
        children: <Widget>[
          new TextField(
            cursorColor: Colors.black87,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: new InputDecoration(
              labelText: "Old Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black87)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              isDense: true,
              suffixIcon: GestureDetector(//call this method when contact with screen is removed
                child: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),

          ),
          SizedBox(height: 30,),
          new TextField(
            cursorColor: Colors.black87,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: new InputDecoration(
              labelText: "New Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black87)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              isDense: true,
              suffixIcon: GestureDetector(//call this method when contact with screen is removed
                child: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),

          ),
          SizedBox(height: 30,),
          new TextField(
            cursorColor: Colors.black87,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            decoration: new InputDecoration(
              labelText: "Confirm Password",
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black87)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              isDense: true,
              suffixIcon: GestureDetector(//call this method when contact with screen is removed
                child: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),

          ),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 36),
              height: 64,
              width: 156,
              child: RaisedButton(
                highlightElevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.circular(36.0),
                    side: BorderSide(color: Colors.white12)),
                disabledColor: Colors.black,
                elevation: 5,
                textColor: Colors.white,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Submit",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Roboto"),
                ),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
