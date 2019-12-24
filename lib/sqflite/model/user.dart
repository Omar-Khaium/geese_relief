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
  String CompanyLogo;

  LoggedInUser(this.id, this.UserGUID, this.UserID, this.FirstName, this.LastName,
      this.ProfilePicture, this.Email, this.CompanyGUID, this.CompanyID,
      this.CompanyName, this.CompanyLogo);


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
    CompanyLogo = map['company']['CompanyLogo'];
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
    CompanyLogo = map['CompanyLogo'];
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
      'CompanyLogo' : CompanyLogo
    };
    return map;
  }

}