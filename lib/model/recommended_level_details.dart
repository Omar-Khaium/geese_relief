import 'package:flutter_grate_app/model/customer_details.dart';

class RecommendedLevelDetails {

  CustomerDetails _customerDetails;
  int _index;

  RecommendedLevelDetails(this._customerDetails, this._index);

  int get index => _index;

  set index(int value) {
    _index = value;
  }

  CustomerDetails get customerDetails => _customerDetails;

  set customerDetails(CustomerDetails value) {
    _customerDetails = value;
  }


}