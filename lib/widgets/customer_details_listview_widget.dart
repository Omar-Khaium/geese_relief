import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/DetailsListModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerDetailsListview extends StatefulWidget {
  @override
  _customerDetailsListviewState createState() =>
      _customerDetailsListviewState();
}

class _customerDetailsListviewState extends State<CustomerDetailsListview> {

  List<DetailsList> lists = [
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
    DetailsList("EST000012","12/04/2019","N/A","587.6"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 400,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: lists.length,
          itemBuilder: (BuildContext context, index) {
        return DetailsList(
          lists[index].estimateId,
          lists[index].estimateDate,
          lists[index].estimateNumber,
          lists[index].estimateAmount
        );
      }),
    );
  }
}
