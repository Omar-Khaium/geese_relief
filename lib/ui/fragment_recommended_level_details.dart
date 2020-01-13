import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/MediaPlayer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class RecommendedLevelDetails extends StatefulWidget{

  Login login;
  LoggedInUser loggedInUser;
  CustomerDetails customer;
  int index;
  ValueChanged<String> backToRecommendedLevel;

  RecommendedLevelDetails(
      {Key key,
        this.login,
        this.loggedInUser,
        this.index,
        this.customer,
        this.backToRecommendedLevel})
      : super(key: key);

  @override
  _RecommendedLevelDetails createState()=>_RecommendedLevelDetails();

}

class _RecommendedLevelDetails extends State<RecommendedLevelDetails>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Level ${widget.index+1}"),
        actions: <Widget>[
          IconButton(
            onPressed: saveDialog,
            icon: Icon(Icons.save),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: saveDialog,
        icon: Icon(Icons.save),
        label: Text("Save"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.white,
      body: new GridView.count(
        crossAxisCount: 3,
        children: new List<Widget>.generate(6, (index) {
          return new GridTile(
              child: Container(
                height: 250,
                width: 250,
                child:new Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5,
                    margin: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new VideoPlayerScreen(),
                        ));
                      },
                      child: Stack(
                        children: <Widget>[
                          Image.asset('images/sign_out.png',height: MediaQuery.of(context).size.height
                            ,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: new Align(
                              alignment: Alignment.center,
                              child: new Icon(Icons.play_circle_filled,size: 72,color: Colors.blueAccent,),

                            ),
                          )
                        ],
                      ),
                    )
                ),
              )
          );
        }),
      ),
    );

  }

  void saveDialog() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
            title: Text(
              "Saving Recommended Level",
              style: estimateTextStyle(),
            ),
            contentTextStyle: estimateTextStyle(),
          ),
        );
      },
    );
    bool status = await _save();
    Navigator.of(context).pop();
    showAPIResponse(
        context,
        status ? "Successful!" : "Failed!",
        Color(status ? COLOR_SUCCESS : COLOR_DANGER));
  }

  Future _save() async {

    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'Id': widget.customer.Id,
      'RecommendedLevel': (widget.index+1).toString(),
      'CompanyId': widget.loggedInUser.CompanyGUID,
    };

    var url = "https://api.rmrcloud.com/RecommendedLevel";
    var result = await http.post(url, headers: headers);
    return json.decode(result.body)['result'];

  }
}