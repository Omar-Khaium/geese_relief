import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:html/dom.dart' as dom;

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_details.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/sqflite/model/user.dart';
import 'package:flutter_grate_app/utils.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SendMailFragment extends StatefulWidget {
  Map map;
  String estimateId;
  String urlPDFPath = "";
  Login accessToken;
  ValueChanged<bool> isLoading;
  LoggedInUser loggedInUser;
  CustomerDetails customerId;

  SendMailFragment(
      this.map, this.estimateId, this.accessToken, this.customerId);

  @override
  _SendMailFragmentState createState() => _SendMailFragmentState();
}

class _SendMailFragmentState extends State<SendMailFragment> {
  TextEditingController _ToEmailController = new TextEditingController();
  TextEditingController _CCEmailController = new TextEditingController();
  TextEditingController _SubjectEmailController = new TextEditingController();
  TextEditingController _BodyEmailController = new TextEditingController();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String emailUrl = "";

  @override
  void initState() {
    super.initState();

    getFileFromUrl(widget.map['filepath']).then((f) {
      setState(() {
        widget.urlPDFPath = f.path;
      });
    });

    _ToEmailController.text = widget.map['EstimateEmailModel']['email'];
    _SubjectEmailController.text = widget.map['EstimateEmailModel']['subject'];
    _BodyEmailController.text = widget.map['EstimateEmailModel']['bodycontent'];
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
        title: Text(
          "Send Mail",
          style: Theme.of(context).textTheme.headline.copyWith(
              color: Colors.grey.shade900, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 26),
            child: GestureDetector(
              onTap: () {
                postData();
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade900,
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          )
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
                Html(
                  data: widget.map['EstimateEmailModel']['bodycontent'],
                  padding: EdgeInsets.all(8.0),
                  onLinkTap: (url) {
                    print("Opening $url...");
                  },
                  customRender: (node, children) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "custom_tag": // using this, you can handle custom tags in your HTML
                          return Column(children: children);
                      }
                    }
                  },
                ),
                /*new TextField(
                  controller: _BodyEmailController,
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
                ),*/
                /* Html(data: map['EstimateEmailModel']['body'],),*/
              ],
            ),
          ),
          VerticalDivider(
            thickness: 2,
          ),
          Expanded(
            flex: 1,
            child: widget.urlPDFPath.isNotEmpty
                ? PDFView(
                    filePath: widget.urlPDFPath,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onError: (error) {
                      print(error.toString());
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        ],
      ),
    );
  }

  Future<String> postData() async {
    try {
      Map<String, String> data = {
        'Authorization': widget.accessToken.accessToken,
        'customerid': widget.customerId.CustomerId,
        'invoiceid': widget.estimateId.toString(),
        'toemail': _ToEmailController.text.toString(),
        'ccmail': _CCEmailController.text.toString(),
        'subject': _SubjectEmailController.text.toString(),
        'body': _BodyEmailController.text.toString(),
      };

      var url = "https://api.gratecrm.com/SendEmailEstimate";
      http.post(url, headers: data).then((response) {
        if (response.statusCode == 200) {
          Map map = json.decode(response.body);
          http.get(map['EmailUrl']).then((responseResults) {
            if (responseResults.statusCode == 200) {
              showAPIResponse(
                  context, "Email Successfully Sent", Colors.green.shade600);
            } else {
              showAPIResponse(context, "Email Not Sent", Colors.red.shade600);
            }
          });
          print(map);
        } else {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.GROUNDED,
            backgroundColor: Colors.redAccent,
            icon: Icon(
              Icons.error_outline,
              size: 24.0,
              color: Colors.white,
            ),
            duration: Duration(seconds: 4),
            leftBarIndicatorColor: Colors.white70,
            boxShadows: [
              BoxShadow(
                color: Colors.red[800],
                offset: Offset(0.0, 2.0),
                blurRadius: 3.0,
              )
            ],
            title: response.toString(),
            message: "",
            shouldIconPulse: false,
          )..show(context);
          widget.accessToken.isAuthenticated = false;
        }
      });
    } catch (error) {
      error.toString();
    }
  }
}
