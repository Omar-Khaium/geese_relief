import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/utils.dart';
import 'package:flutter_grate_app/widgets/custome_back_button.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

import 'package:http/http.dart' as http;
class ChangePasswordFragment extends StatefulWidget {
  ValueChanged<int> backToDashboard;
  Login login;
  ChangePasswordFragment({Key key, this.backToDashboard, this.login}) : super(key: key);

  @override
  _ChangePasswordFragmentState createState() => _ChangePasswordFragmentState();
}

class _ChangePasswordFragmentState extends State<ChangePasswordFragment> {


  TextEditingController _oldPaswordController = new TextEditingController();
  TextEditingController _newPaswordController = new TextEditingController();
  TextEditingController _confirmPaswordController = new TextEditingController();


  Future getPasswordChanged() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'UserName': '${widget.login.username}',
      'Password': '${_oldPaswordController.text}',
      'NewPassword': '${_newPaswordController.text}',
    };
    var url = "http://api.rmrcloud.com/ChangePassword";
    var result = await http.post(url, headers: headers);
    if (result.statusCode == 200){
      if(widget.login.password==_oldPaswordController.text){
        if(_newPaswordController==_confirmPaswordController){

          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blueGrey.shade900,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton(
                      highlightElevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(36.0),
                          side: BorderSide(color: Colors.white12)),
                      disabledColor: Colors.black,
                      color: Colors.black,
                      elevation: 2,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Confirm",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Roboto"),
                      ),
                      onPressed: () {
                      },
                    ),
                    RaisedButton(
                      highlightElevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(36.0),
                          side: BorderSide(color: Colors.white12)),
                      disabledColor: Colors.black,
                      color: Colors.black,
                      elevation: 2,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Cancel",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Roboto"),
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                )
              );
            },
          );
        }
      }

      return result;
    } else {
      showMessage(context, "Network error!", json.decode(result.body), Colors.redAccent, Icons.warning);
      return [];
    }
  }

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
                  controller: _oldPaswordController,
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
                  controller: _newPaswordController,
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
                  controller: _confirmPaswordController,
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
                      color: Colors.black,
                      elevation: 5,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Submit",
                        style: new TextStyle(
                            color: Colors.white, fontSize: 22, fontFamily: "Roboto"),
                      ),
                      onPressed: getPasswordChanged,
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
