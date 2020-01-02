import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/MediaPlayer.dart';

class RecommendedLevelDetails extends StatefulWidget{

  Login login;
  LoggedInUser loggedInUser;
  int  index;
  ValueChanged<String> backToRecommendedLevel;

  RecommendedLevelDetails(
      {Key key,
        this.login,
        this.loggedInUser,
        this.index,
        this.backToRecommendedLevel})
      : super(key: key);

  @override
  _RecommendedLevelDetails createState()=>_RecommendedLevelDetails();

}

class _RecommendedLevelDetails extends State<RecommendedLevelDetails>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.count(
      crossAxisCount: 3,
      children: new List<Widget>.generate(16, (index) {
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
                          child: new Icon(Icons.play_circle_filled,size: 48,color: Colors.black,),

                        ),
                      )
                    ],
                  ),
                )
            ),
          )
        );
      }),
    );

  }

}