import 'package:flutter_grate_app/model/customer.dart';
import 'package:flutter_grate_app/model/estimate.dart';

class CustomerDetails{
  String Id;
  String CustomerId;
  String Title;
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
  String RecommendedLevel;
  bool HasInspectionReport;
  List<Estimate> estimates;

  CustomerDetails(this.Id, this.CustomerId, this.Title, this.FirstName,
      this.LastName, this.BusinessName, this.PrimaryPhone, this.SecondaryPhone,
      this.EmailAddress, this.Street, this.City, this.State, this.ZipCode,
      this.RecommendedLevel, this.estimates);

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
    return _CheckName(Title) + " " + _CheckName(FirstName) + " " + _CheckName(LastName);
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

  CustomerDetails.fromMap(Map<String, dynamic> map) {
    Id = map["CustomerDetails"]['Id'].toString();
    CustomerId = map["CustomerDetails"]['CustomerId'];
    Title = map["CustomerDetails"]['Title'];
    FirstName = map["CustomerDetails"]['FirstName'];
    LastName = map["CustomerDetails"]['LastName'];
    BusinessName = map["CustomerDetails"]['BusinessName'];
    PrimaryPhone = map["CustomerDetails"]['PrimaryPhone'];
    SecondaryPhone = map["CustomerDetails"]['SecondaryPhone'];
    EmailAddress = map["CustomerDetails"]['EmailAddress'];
    Street = map["CustomerDetails"]['Street'];
    City = map["CustomerDetails"]['City'];
    State = map["CustomerDetails"]['State'];
    ZipCode = map["CustomerDetails"]['ZipCode'];
    RecommendedLevel = map["CustomerDetails"]['RecommendedLevel'];
    var estimateMap = map['EstimateList']['EstimateList'];
    if(estimateMap==null) {
      estimates = [];
    } else {
      estimates = List.generate(estimateMap.length, (index) {
        return Estimate.fromMap(estimateMap[index]);
      });
    }
  }
}