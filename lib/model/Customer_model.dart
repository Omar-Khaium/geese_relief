class Customer {
  String customer_firstName;
  String customer_lastName;
  String customer_street;
  String customer_city;
  String customer_state;
  String customer_zip;
  String customer_contact;
  String customer_email;


  Customer(this.customer_firstName, this.customer_lastName,
      this.customer_street, this.customer_city, this.customer_state,
      this.customer_zip, this.customer_contact, this.customer_email);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'FirstName' : customer_firstName,
      'LastName' : customer_lastName,
      'CellNo' : customer_contact,
      'EmailAddress' : customer_email,
      'Street' : customer_street,
      'City' : customer_city,
      'State' : customer_state,
      'ZipCode' : customer_zip,
    };
    return map;
  }
  Customer.fromMap(Map<String,dynamic> map){
    customer_firstName=map['FirstName'];
    customer_lastName=map['LastName'];
    customer_contact=map['CellNo'];
    customer_email=map['EmailAddress'];
    customer_street=map['Street'];
    customer_city=map['City'];
    customer_state=map['State'];
    customer_zip=map['ZipCode'];
  }

}
