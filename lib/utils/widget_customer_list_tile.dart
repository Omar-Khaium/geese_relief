import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/ui/ui_customer_details.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerListTile extends StatelessWidget {
  final Customer item;

  CustomerListTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => CustomerDetails(item),),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.public,
                  color: Colors.blue,
                  size: 18,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
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
              margin: EdgeInsets.only(bottom: 8, left: 4, top: 4),
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
              margin: EdgeInsets.only(bottom: 8, left: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    MdiIcons.mapMarker,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    item.routeName,
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4, left: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.equalizer,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    item.geeseCount.toString(),
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Row(
                children: <Widget>[
                  Chip(
                    avatar: Icon(
                      MdiIcons.commentMultiple,
                      size: 18,
                      color: Colors.grey,
                    ),
                    backgroundColor: Colors.white,
                    label: Text(item.commentCount.toString()),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Chip(
                    avatar: Icon(
                      MdiIcons.fileDocument,
                      size: 18,
                      color: Colors.grey,
                    ),
                    backgroundColor: Colors.white,
                    label: Text(item.mediaCount.toString()),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
