class Zip{

  int id;
  String zipCode;
  String city;
  String state;
  String country;

  Zip(this.zipCode, this.city, this.state, this.country);

  Zip.fromMap(Map<String, dynamic> map) {
    id = map['Id'];
    zipCode = map['ZipCode'];
    city = map['City'];
    state = map['State'];
    country = map['Country'];
  }
}