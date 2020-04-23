import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/ui/ui_edit_user.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserDetails extends StatefulWidget {
  final User user;

  UserDetails(this.user);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => EditUserUI(widget.user), fullscreenDialog: true),
            ),
            icon: Icon(Icons.edit, size: 18, color: Theme.of(context).primaryColor,),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 144,
            height: 144,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 92,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  left: 4,
                  bottom: 4,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    radius: 88,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  left: 8,
                  bottom: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 84,
                    child: Text(
                      widget.user.name.substring(0, 1).toUpperCase(),
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            widget.user.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 16,
          ),
          Chip(
            avatar: Icon(
              MdiIcons.medal,
              size: 18,
              color: Colors.grey.shade700,
            ),
            backgroundColor: Colors.grey.shade300,
            label: Text(
              widget.user.role,
              style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          spreadRadius: 4,
                          blurRadius: 4)
                    ]),
                padding: EdgeInsets.only(top: 12),
                child: ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(MdiIcons.at,
                              size: 16, color: Colors.deepPurple.shade600),
                        ),
                      ),
                      subtitle: Text("Username"),
                      title: Text(widget.user.userName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(widget.user.gender=="Male" ? MdiIcons.genderMale : MdiIcons.genderFemale,
                              size: 16, color: Colors.cyan.shade600),
                        ),
                      ),
                      subtitle: Text("Gender"),
                      title: Text(widget.user.gender,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.email,
                              size: 16, color: Colors.orangeAccent.shade700),
                        ),
                      ),
                      subtitle: Text("Email"),
                      title: Text(widget.user.email.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.call,
                              size: 16, color: Colors.red.shade700),
                        ),
                      ),
                      subtitle: Text("Phone"),
                      title: Text(widget.user.phone.toString(),
                          style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.bold),),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(MdiIcons.mapMarker,
                              size: 16, color: Colors.green.shade700),
                        ),
                      ),
                      subtitle: Text("Address"),
                      title: Text(
                        widget.user.address,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
