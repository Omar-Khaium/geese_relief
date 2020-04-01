class Customer {
  String _name;
  String _routeName;
  int _geeseCount;
  int _commentCount;
  int _mediaCount;

  Customer(this._name, this._routeName, this._geeseCount, this._commentCount,
      this._mediaCount);

  int get mediaCount => _mediaCount;

  set mediaCount(int value) {
    _mediaCount = value;
  }

  int get commentCount => _commentCount;

  set commentCount(int value) {
    _commentCount = value;
  }

  int get geeseCount => _geeseCount;

  set geeseCount(int value) {
    _geeseCount = value;
  }

  String get routeName => _routeName;

  set routeName(String value) {
    _routeName = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}