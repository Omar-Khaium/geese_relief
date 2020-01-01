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


  Product.fromMap(Map<String, dynamic> map) {
    id = map['key'];
    guid = map['key'];
    name = map['key'];
    description = map['key'];
    quantity = map['key'];
    rate = map['key'];
    discount = map['key'];
    discountAsPercentage = map['key'];
    price = map['key'];
    date = map['key'];
  }

  Map<String, String> toMap() {
    return <String, String> {
      'id' : id.toString(),
      'guid' : guid,
      'name' : name,
      'description' : description,
      'quantity' : quantity.toString(),
      'rate' : rate.toString(),
      'discount' : discount.toString(),
      'discountAsPercentage' : discountAsPercentage.toString(),
      'price' : price.toString(),
      'date' : date,
    };
  }
}