import 'package:flutter/material.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/ui/ui_assign_route.dart';
import 'package:geese_relief/ui/ui_user_details.dart';
import 'package:geese_relief/utils/widget_delete_confirmation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserListTile extends StatelessWidget {
  final User item;
  final bool showBanner;

  UserListTile(this.item, {this.showBanner});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: showBanner!=null && showBanner ? Banner(
        message: "User",
        color: Theme.of(context).primaryColor,
        location: BannerLocation.topEnd,
        child: ListTile(
          onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => UserDetails(item),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => AssignRouteUI(item),
                  ),
                ),
                icon: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    MdiIcons.mapMarkerPlus,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => DeleteConfirmation(
                    onPositive: () {
                      Navigator.of(context).pop();
                    },
                    onNegative: () {
                      Navigator.of(context).pop();
                    },
                    title: "Delete User?",
                    name: item.name,
                  ),
                ),
                icon: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 12, left: 4, top: 4),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12, left: 4),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        item.email,
                        style: Theme.of(context).textTheme.body1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12, left: 4),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        item.phone,
                        style: Theme.of(context).textTheme.body1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12, left: 4),
                alignment: Alignment.centerLeft,
                child: Chip(
                  avatar: Icon(
                    MdiIcons.medal,
                    size: 18,
                    color: Colors.grey,
                  ),
                  backgroundColor: Colors.grey.shade200,
                  label: Text(item.role),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ),
      ) : ListTile(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => UserDetails(item),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) => AssignRouteUI(item),
                ),
              ),
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  MdiIcons.mapMarkerPlus,
                  color: Colors.blue,
                  size: 18,
                ),
              ),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => DeleteConfirmation(
                  onPositive: () {
                    Navigator.of(context).pop();
                  },
                  onNegative: () {
                    Navigator.of(context).pop();
                  },
                  title: "Delete User?",
                  name: item.name,
                ),
              ),
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 12, left: 4, top: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12, left: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      item.email,
                      style: Theme.of(context).textTheme.body1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12, left: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      item.phone,
                      style: Theme.of(context).textTheme.body1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12, left: 4),
              alignment: Alignment.centerLeft,
              child: Chip(
                avatar: Icon(
                  MdiIcons.medal,
                  size: 18,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey.shade200,
                label: Text(item.role),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
