import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/model/ui_media.dart';
import 'package:geese_relief/ui/ui_comments.dart';
import 'package:geese_relief/ui/ui_customer_history.dart';
import 'package:geese_relief/ui/ui_edit_customer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerDetails extends StatefulWidget {
  final Customer customer;

  CustomerDetails(this.customer);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
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
            onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => EditCustomerUI(widget.customer),
              ),
            ),
            icon: Icon(
              Icons.edit,
              size: 18,
              color: Theme.of(context).primaryColor,
            ),
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
                      widget.customer.name.substring(0, 1).toUpperCase(),
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
            widget.customer.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 16,
          ),
          ActionChip(
            onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => CustomerHistoryUI(widget.customer),
              ),
            ),
            avatar: Icon(
              MdiIcons.earth,
              size: 18,
              color: Colors.blue.shade600,
            ),
            backgroundColor: Colors.blue.shade100,
            label: Text(
              "History",
              style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Colors.blue.shade600, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
                          child: Icon(MdiIcons.mapMarker,
                              size: 16, color: Colors.deepPurple.shade600),
                        ),
                      ),
                      subtitle: Text("Route"),
                      title: Text(
                        widget.customer.routeName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
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
                          child: Icon(Icons.equalizer,
                              size: 16, color: Colors.orangeAccent.shade700),
                        ),
                      ),
                      subtitle: Text("Gesse  Count"),
                      title: Text(
                        widget.customer.geeseCount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
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
                          child: Icon(MdiIcons.commentOutline,
                              size: 16, color: Colors.red.shade700),
                        ),
                      ),
                      subtitle: Text("Comments"),
                      title: Text(
                        widget.customer.commentCount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.red.shade700,
                      ),
                      onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) => CommentsUI(widget.customer),
                        ),
                      ),
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
                          child: Icon(MdiIcons.folder,
                              size: 16, color: Colors.green.shade700),
                        ),
                      ),
                      subtitle: Text("Media"),
                      title: Text(
                        widget.customer.mediaCount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.green.shade700,
                      ),
                      onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) => MediaUI(widget.customer),
                        ),
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
