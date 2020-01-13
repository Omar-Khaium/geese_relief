import 'dart:io';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SendMailFragment extends StatefulWidget {
  Map map;
  String urlPDFPath = "";

  SendMailFragment(this.map);

  @override
  _SendMailFragmentState createState() => _SendMailFragmentState();
}

class _SendMailFragmentState extends State<SendMailFragment> {
  TextEditingController _ToEmailController = new TextEditingController();
  TextEditingController _CCEmailController = new TextEditingController();
  TextEditingController _SubjectEmailController = new TextEditingController();
  TextEditingController _BodyEmailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getFileFromUrl(widget.map['filepath']).then((f) {
      setState(() {
        widget.urlPDFPath = f.path;
      });
    });

    _ToEmailController.text=widget.map['EstimateEmailModel']['email'];
    _SubjectEmailController.text=widget.map['EstimateEmailModel']['subject'];
    _BodyEmailController.text=widget.map['EstimateEmailModel']['bodycontent'];
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Send Mail",style: fragmentTitleStyle(),),
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Icon(Icons.send),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                TextField(
                  controller: _ToEmailController,
                  cursorColor: Colors.black87,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  onChanged: (val) {
                    setState(() {});
                  },
                  style: customTextStyle(),
                  decoration: new InputDecoration(
                    labelText: "To",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    errorText: _ToEmailController.text.isNotEmpty
                        ? null
                        : "* Required",
                    hintStyle: customHintStyle(),
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: _CCEmailController,
                  cursorColor: Colors.black87,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  onChanged: (val) {
                    setState(() {});
                  },
                  style: customTextStyle(),
                  decoration: new InputDecoration(
                    labelText: "cc",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    errorText: _CCEmailController.text.isNotEmpty
                        ? null
                        : "* Required",
                    hintStyle: customHintStyle(),
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: _SubjectEmailController,
                  cursorColor: Colors.black87,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  onChanged: (val) {
                    setState(() {});
                  },
                  style: customTextStyle(),
                  decoration: new InputDecoration(
                    labelText: "Subject",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    errorText: _SubjectEmailController.text.isNotEmpty
                        ? null
                        : "* Required",
                    hintStyle: customHintStyle(),
                    isDense: true,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                new TextField(
                  controller:_BodyEmailController,
                  obscureText: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 10,
                  style: customTextStyle(),
                  decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      errorText: _SubjectEmailController.text.isNotEmpty
                          ? null
                          : "* Required",
                      labelText: "Body",
                      labelStyle: customTextStyle(),
                      hintStyle: customHintStyle(),
                      alignLabelWithHint: false,
                      isDense: true),
                ),
               /* Html(data: map['EstimateEmailModel']['body'],),*/
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            flex: 1,
            child:widget.urlPDFPath.isNotEmpty ?
            PDFView(
              filePath: widget.urlPDFPath,
              autoSpacing: true,
              enableSwipe: true,
              pageSnap: true,
              swipeHorizontal: true,
              nightMode: false,
              onError: (e) {
                print(e);
              } ,
          ):Center(
              child: CircularProgressIndicator(),
            )
          )
        ],
      ),
    );
  }


}

