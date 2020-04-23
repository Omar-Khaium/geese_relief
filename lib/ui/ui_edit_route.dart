import 'package:flutter/material.dart';
import 'package:geese_relief/model/route.dart' as model;

class EditRouteUI extends StatefulWidget {
  final model.Route route;

  EditRouteUI(this.route);

  @override
  _EditRouteUIState createState() => _EditRouteUIState();
}

class _EditRouteUIState extends State<EditRouteUI> {
  TextEditingController _controller = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.route.name,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Name",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "E.g. - \"22 Baker Street\""),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  child: Text(
                    "Update",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
