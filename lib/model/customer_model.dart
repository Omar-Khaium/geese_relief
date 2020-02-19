class Customer {
  String customer_id;
  String Id;
  String CustomerId;
  String Title;
  String Type;
  String CustomerType;
  String FirstName;
  String LastName;
  String BusinessName;
  String PrimaryPhone;
  String SecondaryPhone;
  String EmailAddress;
  String Street;
  String City;
  String State;
  String ZipCode;

  Customer(this.Id, this.CustomerId, this.Title, this.Type, this.CustomerType, this.FirstName, this.LastName,
      this.BusinessName, this.PrimaryPhone, this.SecondaryPhone,
      this.EmailAddress, this.Street, this.City, this.State, this.ZipCode);

  Customer.fromMap(Map<String, dynamic> map) {
    Id = map['Id'].toString();
    CustomerId = map['CustomerId'];
    Title = map['Title'];
    Type = map['Type'];
    CustomerType = map['CustomerType'];
    FirstName = map['FirstName'];
    LastName = map['LastName'];
    BusinessName = map['BusinessName'];
    PrimaryPhone = map['PrimaryPhone'];
    SecondaryPhone = map['SecondaryPhone'];
    EmailAddress = map['EmailAddress'];
    Street = map['Street'];
    City = map['City'];
    State = map['State'];
    ZipCode = map['ZipCode'];
  }

  String get Name {
    return _CheckNames().trim();
  }

  String get Email {
    return _CheckEmail().trim();
  }

  String get Address {
    return _CheckStreet().trim();
  }

  String get ContactNum {
    return _CheckContactNo().trim();
  }

  bool _validate(String val){
    return val==null || val.isEmpty ? false : true;
  }

  String _CheckNames(){
    return Type!=null&&Type=="Commercial" ? (BusinessName!=null&&BusinessName.isNotEmpty ? _CheckName(BusinessName) : _CheckName(Title) + " " + _CheckName(FirstName) + " " + _CheckName(LastName)) : _CheckName(Title) + " " + _CheckName(FirstName) + " " + _CheckName(LastName);
  }

  String _CheckName(String val){
    return _validate(val) ? val : "";
  }

  String _CheckStreet(){
    return _validate(Street) ? Street + "\n" + _CheckCity(false) : _CheckCity(true);
  }

  String _CheckCity(bool flag){
    return _validate(City) ? City + ", " + _CheckState(false) : (flag ? "\n" + _CheckState(false) : _CheckState(true));
  }

  String _CheckState(bool flag){
    return _validate(State) ? State + " " + _CheckZip(false) : (flag ? ", " + _CheckZip(false) : _CheckZip(true));
  }

  String _CheckZip(bool flag){
    return _validate(ZipCode) ? ZipCode : (flag ? "-" : "");
  }

  String _CheckContactNo(){
    return _validate(PrimaryPhone) ? PrimaryPhone : (_validate(SecondaryPhone) ? SecondaryPhone : "-");
  }

  String _CheckEmail(){
    return _validate(EmailAddress) ? EmailAddress : "-";
  }
}
