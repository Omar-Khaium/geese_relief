class LoggedInUser {
  int id;
  String UserGUID;
  String UserID;
  String FirstName;
  String LastName;
  String ProfilePicture;
  String Email;
  String CompanyGUID;
  String CompanyID;
  String CompanyName;
  String CompanyEmail;
  String CompanyLogo;
  String CompanyPhone;
  String CompanyFax;
  String CompanyStreet;
  String CompanyCity;
  String CompanyState;
  String CompanyZipCode;


  LoggedInUser(this.id, this.UserGUID, this.UserID, this.FirstName,
      this.LastName, this.ProfilePicture, this.Email, this.CompanyGUID,
      this.CompanyID, this.CompanyName, this.CompanyEmail, this.CompanyLogo, this.CompanyPhone,
      this.CompanyFax, this.CompanyStreet, this.CompanyCity, this.CompanyState,
      this.CompanyZipCode);

  LoggedInUser.fromMap(Map<String, dynamic> map) {
    UserGUID = map['emp']['UserId'];
    UserID = map['emp']['Id'].toString();
    FirstName = map['emp']['FirstName'];
    LastName = map['emp']['LastName'];
    Email = map['emp']['Email'];
    ProfilePicture = map['emp']['ProfilePicture'];
    CompanyID = map['company']['Id'].toString();
    CompanyGUID = map['company']['CompanyId'];
    CompanyName = map['company']['CompanyName'];
    CompanyEmail = map['company']['EmailAdress'];
    CompanyLogo = map['company']['CompanyLogo'];
    CompanyPhone = map['company']['Phone'];
    CompanyFax = map['company']['Fax'];
    CompanyStreet = map['company']['Street'];
    CompanyCity = map['company']['City'];
    CompanyState = map['company']['State'];
    CompanyZipCode = map['company']['ZipCode'];
  }

  LoggedInUser.fromDBMap(Map<String, dynamic> map) {
    UserGUID = map['UserGUID'];
    UserID = map['UserID'];
    LastName = map['UserName'];
    Email = map['Email'];
    ProfilePicture = map['ProfilePicture'];
    CompanyID = map['CompanyID'];
    CompanyGUID = map['CompanyGUID'];
    CompanyName = map['CompanyName'];
    CompanyEmail = map['CompanyEmail'];
    CompanyLogo = map['CompanyLogo'];
    CompanyPhone = map['CompanyPhone'];
    CompanyFax = map['CompanyFax'];
    CompanyStreet = map['CompanyStreet'];
    CompanyCity = map['CompanyCity'];
    CompanyState = map['CompanyState'];
    CompanyZipCode = map['CompanyZipCode'];
  }

  String get UserName {
    return _CheckNames().trim();
  }

  String _CheckNames(){
    return _CheckName(FirstName) + " " + _CheckName(LastName);
  }

  String _CheckName(String val){
    return _validate(val) ? val : "";
  }

  bool _validate(String val){
    return val==null || val.isEmpty ? false : true;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id' : null,
      'UserID' : UserID,
      'UserGUID' : UserGUID,
      'UserName' : UserName,
      'ProfilePicture' : ProfilePicture,
      'Email' : Email,
      'CompanyID' : CompanyID,
      'CompanyGUID' : CompanyGUID,
      'CompanyName' : CompanyName,
      'CompanyEmail' : CompanyEmail,
      'CompanyLogo' : CompanyLogo,
      'CompanyPhone' : CompanyPhone,
      'CompanyFax' : CompanyFax,
      'CompanyStreet' : CompanyStreet,
      'CompanyCity' : CompanyCity,
      'CompanyState' : CompanyState,
      'CompanyZipCode' : CompanyZipCode
    };
    return map;
  }

  String get CompanyEmailAddress {
    return _CheckEmail().trim();
  }

  String get CompanyAddress {
    return _CheckStreet().trim();
  }

  String get CompanyContactNumber {
    return _CheckContactNo().trim();
  }

  String get CompanyFaxNumber {
    return _CheckFax().trim();
  }

  String _CheckContactNo(){
    return _validate(CompanyPhone) ? CompanyPhone : "-";
  }

  String _CheckFax(){
    return _validate(CompanyFax) ? CompanyFax : "-";
  }

  String _CheckEmail(){
    return _validate(CompanyEmail) ? CompanyEmail : "-";
  }

  String _CheckStreet(){
    return _validate(CompanyStreet) ? CompanyStreet + "\n" + _CheckCity(false) : _CheckCity(true);
  }

  String _CheckCity(bool flag){
    return _validate(CompanyCity) ? CompanyCity + ", " + _CheckState(false) : (flag ? "\n" + _CheckState(false) : _CheckState(true));
  }

  String _CheckState(bool flag){
    return _validate(CompanyState) ? CompanyState + " " + _CheckZip(false) : (flag ? ", " + _CheckZip(false) : _CheckZip(true));
  }

  String _CheckZip(bool flag){
    return _validate(CompanyZipCode) ? CompanyZipCode : (flag ? "-" : "");
  }

}