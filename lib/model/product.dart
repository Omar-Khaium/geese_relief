import 'package:intl/intl.dart';

class Product {
  int id;
  String guid;
  String name;
  String description;
  int quantity;
  double rate;
  double discount;
  bool discountAsPercentage;
  double price;
  String date;

  Product(this.id, this.guid, this.name, this.description, this.quantity,
      this.rate, this.discount, this.discountAsPercentage, this.price, this.date);

  String get Name {
    return name==null ? "-" : name;
  }

  String get Description {
    return description==null ? "-" : description;
  }

  String get Quantity {
    return quantity==null || quantity==0 ? "1" : quantity.toString();
  }

  String get Discount {
    return discount==null ? "0.0" : discount.toStringAsFixed(2);
  }

  String get Rate {
    return rate==null ? "0.0" : rate.toStringAsFixed(2);
  }

  String get Date {
    return date==null ? DateFormat('MM/dd/yyyy').format(DateTime.now()) : date;
  }

  Product.fromMap(Map<String, dynamic> map) {
    guid = map['EquipmentId'];
    name = map['EquipmentName'];
    description = map['EquipmentType'];
    quantity = map['QuantityAvailable'];
    rate = map['RetailPrice'];
  }

  Map<String, dynamic> toJson() =>
      {
        'EquipmentId' : guid,
        'EquipName' : name,
        'EquipDetail' : description,
        'Quantity' : quantity,
        'UnitPrice' : rate,
        'TotalPrice' : price,
      };
}