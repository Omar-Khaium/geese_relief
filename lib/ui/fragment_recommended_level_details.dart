import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/model/video_preview.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/widgets/MediaPlayer.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class RecommendedLevelDetails extends StatefulWidget {
  final Login login;
  final LoggedInUser loggedInUser;
  final CustomerDetails customer;
  final int index;
  final ValueChanged<String> backToRecommendedLevel;
  final ValueChanged<int> updateRecommendedLevel;
  bool _isSelected=true;

  RecommendedLevelDetails(
      {Key key,
      this.login,
      this.loggedInUser,
      this.index,
      this.customer,
      this.backToRecommendedLevel,
      this.updateRecommendedLevel})
      : super(key: key);

  @override
  _RecommendedLevelDetails createState() => _RecommendedLevelDetails();
}

class _RecommendedLevelDetails extends State<RecommendedLevelDetails> {
  List<VideoPreview> _list = [
    new VideoPreview(
        "images/video.mp4", "images/peach_of_mind.jpg", "Peace Of Mind"),
    new VideoPreview("images/video.mp4", "images/no_power.PNG", "No Power"),
    new VideoPreview(
        "images/video.mp4", "images/flooded_basement.PNG", "Flooded Basement"),
    new VideoPreview("images/video.mp4", "images/odors.PNG", "Odors"),
    new VideoPreview(
        "images/video.mp4", "images/unhealthy_basement.PNG", "Unhealthy Home"),
    new VideoPreview(
        "images/video.mp4", "images/system_failure.PNG", "System Failure"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommended Level ${widget.index + 1}"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: saveDialog,
        icon: Icon(Icons.save),
        label: Text("Save"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 4,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Maintencane",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 5
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Carbon Monoxide Detector",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 5
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Moisture Control",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 5
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Full Wall Protection",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 4
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Full Perimerter GD System",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 3
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "FastSump Perimeter Inverter & Battery",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 2
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Secondary Pump",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: (widget.index + 1) >= 2
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Secondary Fast Sump Liner",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Primary FastSump",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.grey.shade800,
                          size: 16,
                        ),
                        title: Wrap(
                          children: <Widget>[
                            Text(
                              "Pump Geek / Radon Test Kit",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  decorationThickness: 2,
                                  decorationColor: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: new GridView.count(
                crossAxisCount: 3,
                children: new List<Widget>.generate(6, (index) {
                  return new GridTile(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: new Card(
                        elevation: 4,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  new VideoPlayerScreen(
                                    url: _list[index].url,
                                  ),
                                ));
                          },
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                _list[index].thumbnail,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  decoration:
                                      BoxDecoration(color: Colors.black87),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          _list[index].title,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 18),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Icon(
                                          Icons.play_arrow, color: Colors.red, size: 36,
                                        )
                                      ],
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ));
                }),
              ),
            ),
          ],
        ),
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
    showAPIResponse(context, status ? "Successful!" : "Failed!",
        Color(status ? COLOR_SUCCESS : COLOR_DANGER));
    widget.updateRecommendedLevel(widget.index);
  }

  Future _save() async {
    Map<String, String> headers = {
      'Authorization': widget.login.accessToken,
      'Id': widget.customer.Id,
      'RecommendedLevel': (widget.index + 1).toString(),
      'CompanyId': widget.loggedInUser.CompanyGUID,
    };

    var result = await http.post(BASE_URL+API_SAVE_RECOMMENDED_LEVEL, headers: headers);
    return json.decode(result.body)['result'];
  }
}
