import 'package:flutter_grate_app/model/customer.dart';

class Customer {
  int id;
  String customerId;
  String name;
  String contactNum;
  String email;
  String address;
  String image = "https://pisco.meaww.com/a3422010-c2a9-4757-87fc-3b381d587ef4.jpg";

  Customer(this.id, this.name, this.contactNum, this.email, this.address,
      this.image);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id' : id,
      'customerId' : customerId,
      'name' : name,
      'contactNum' : contactNum,
      'email' : email,
      'address' : address,
      'image' : image,
    };
    return map;
  }

  Customer.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    customerId = map['customerId'];
    name = map['name'];
    contactNum = map['contactNum'];
    email = map['email'];
    address = map['address'];
    image = map['image'];
  }

  Customer.fromNetworkCustomer(NetworkCustomer customer) {
    customerId = customer.Id;
    name = customer.Name;
    contactNum = customer.ContactNum;
    email = customer.Email;
    address = customer.Address;
  }

}