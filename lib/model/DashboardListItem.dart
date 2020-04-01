class DashboardListItem {
  String _name;
  String _route;
  int _count;
  String _checkIn;
  String _checkOut;

  DashboardListItem(this._name, this._route, this._count, this._checkIn,
      this._checkOut);

  String get checkOut => _checkOut;

  set checkOut(String value) {
    _checkOut = value;
  }

  String get checkIn => _checkIn;

  set checkIn(String value) {
    _checkIn = value;
  }

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  String get route => _route;

  set route(String value) {
    _route = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}