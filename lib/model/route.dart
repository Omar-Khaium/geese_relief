class Route {
  String name;
  int customerCount;
  List<LatLng> markers;

  Route(this.name, this.customerCount, this.markers);
}

class LatLng {
  double lat;
  double lng;

  LatLng(this.lat, this.lng);
}