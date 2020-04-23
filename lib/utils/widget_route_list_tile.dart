import 'package:flutter/material.dart';
import 'package:geese_relief/model/route.dart' as model;
import 'package:geese_relief/ui/ui_route_customer.dart';
import 'package:geese_relief/ui/ui_route_details.dart';
import 'package:geese_relief/ui/ui_show_route.dart';
import 'package:geese_relief/utils/widget_delete_confirmation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RouteListTile extends StatelessWidget {
  final model.Route item;

  RouteListTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) => RouteDetails(item),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                      title: "Delete Route?",
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
                  margin: EdgeInsets.only(bottom: 12, top: 8),
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
                        item.name,
                        style: Theme.of(context).textTheme.body1,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        MdiIcons.accountGroup,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        item.customerCount.toString(),
                        style: Theme.of(context).textTheme.body1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12, left: 16, right: 16),
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 12,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                ActionChip(
                  onPressed: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (context) => RouteCustomers(item.name))),
                  avatar: Icon(
                    MdiIcons.cogs,
                    size: 18,
                  ),
                  backgroundColor: Colors.grey.shade200,
                  label: Text("Manage Customers"),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                ActionChip(
                  onPressed: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (context) => ShowRoute(item.name))),
                  avatar: Icon(
                    MdiIcons.mapMarkerPath,
                    size: 18,
                  ),
                  backgroundColor: Colors.grey.shade200,
                  label: Text("Show Route"),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
