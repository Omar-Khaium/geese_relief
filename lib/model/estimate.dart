import 'package:intl/intl.dart';

import '../utils.dart';

class Estimate {
  String Id;
  String InvoiceId;
  String Description;
  String Quantity;
  String Price;
  String CreatedDate;

  Estimate(this.Id, this.InvoiceId, this.Description, this.Quantity, this.Price,
      this.CreatedDate);

  Estimate.fromMap(Map<String,dynamic> map){
    Id=map['Id'].toString();
    InvoiceId=map['InvoiceId'].toString();
    Description=map['Description'].toString();
    Quantity=map['EstimateEqpCount'].toString();
    Price=map['TotalAmount'].toString();
    CreatedDate= formatDate(map['CreatedDate']);
  }

}