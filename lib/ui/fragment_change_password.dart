import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

class ChangePasswordFragment extends StatefulWidget {
  ValueChanged<int> backToDashboard;
  Login login;
  ChangePasswordFragment({Key key, this.backToDashboard, this.login}) : super(key: key);

  @override
  _ChangePasswordFragmentState createState() => _ChangePasswordFragmentState();
}

class _ChangePasswordFragmentState extends State<ChangePasswordFragment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:32, right:32, top:16),
      child: new Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Row(
                children: <Widget>[
                  CustomBackButton(onTap: ()=> widget.backToDashboard(0),),
                  SizedBox(width: 16,),
                  Text("Change Password", style: fragmentTitleStyle()),
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            child: Divider(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                new TextField(
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  decoration: new InputDecoration(
                    labelText: "Old Password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      //call this method when contact with screen is removed
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                new TextField(
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  decoration: new InputDecoration(
                    labelText: "New Password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      //call this method when contact with screen is removed
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                new TextField(
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  decoration: new InputDecoration(
                    labelText: "Confirm Password",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      //call this method when contact with screen is removed
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 36),
                    height: 64,
                    width: 156,
                    child: RaisedButton(
                      highlightElevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(36.0),
                          side: BorderSide(color: Colors.white12)),
                      disabledColor: Colors.black,
                      elevation: 5,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Submit",
                        style: new TextStyle(
                            color: Colors.white, fontSize: 22, fontFamily: "Roboto"),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
