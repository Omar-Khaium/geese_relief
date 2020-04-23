import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constraints.dart';

class RouteMapWidget extends StatefulWidget {
  @override
  _RouteMapWidgetState createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  GoogleMapController _controller;
  GoogleMapPolyline _googleMapPolyline =
  new GoogleMapPolyline(apiKey: MAP_API_TOKEN);

  int _polylineCount = 1;
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};

  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[],
    <PatternItem>[PatternItem.dash(28), PatternItem.gap(8)],
    <PatternItem>[PatternItem.dash(28), PatternItem.gap(14)],
    <PatternItem>[PatternItem.dash(28), PatternItem.gap(21)],
    <PatternItem>[PatternItem.dash(28), PatternItem.gap(28)],
  ];

  LatLng _mapInitLocation = LatLng(40.683337, -73.940432);

  LatLng _originLocation1 = LatLng(40.677939, -73.941755);
  LatLng _originLocation2 = LatLng(40.647939, -73.941755);
  LatLng _destinationLocation1 = LatLng(40.698432, -73.924038);
  LatLng _destinationLocation2 = LatLng(40.698432, -73.944038);

  var _geoLocator = Geolocator();
  var _locationOptions =
  LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);

  ImageConfiguration _configuration;
  BitmapDescriptor originMarker, destinationMarker;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    listenToLocationChange();
  }

  @override
  Widget build(BuildContext context) {

    return GoogleMap(
      buildingsEnabled: true,
      mapToolbarEnabled: true,
      indoorViewEnabled: true,
      compassEnabled: true,
      trafficEnabled: false,
      mapType: MapType.normal,
      rotateGesturesEnabled: true,
      tiltGesturesEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      polylines: Set<Polyline>.of(_polylines.values),
      initialCameraPosition: CameraPosition(
        target: _mapInitLocation,
        zoom: 13,
      ),
      markers: Set.from(_markers),
      onMapCreated: mapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  void mapCreated(controller) {
    _controller = controller;
    _getPolylinesWithLocation();
    _controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: _destinationLocation1,
          northeast: _originLocation2,
        ),
        32.0,
      ),);
  }

  void listenToLocationChange() async {
    _geoLocator.getPositionStream(_locationOptions).listen((Position position) {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;

      if (_controller != null) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: _mapInitLocation,
              zoom: 13,
            ),
          ),
        );
      }
    });
  }

  _getPolylinesWithLocation() async {
    initializeMarkers();
    List<LatLng> _coordinates1 =
    await _googleMapPolyline.getCoordinatesWithLocation(
        origin: _originLocation1,
        destination: _destinationLocation1,
        mode: RouteMode.driving);
    List<LatLng> _coordinates2 =
    await _googleMapPolyline.getCoordinatesWithLocation(
        origin: _originLocation2,
        destination: _destinationLocation2,
        mode: RouteMode.driving);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates1,0);
    _addPolyline(_coordinates2,1);
  }

  _addPolyline(List<LatLng> _coordinates, int patternId) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        patterns: patterns[patternId],
        color: Theme.of(context).primaryColor,
        points: _coordinates,
        width: 2,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  void initializeMarkers() async {
    _configuration =
        createLocalImageConfiguration(context, size: Size(48, 48));
    originMarker = await BitmapDescriptor.fromAssetImage(_configuration, "images/origin.png");
    destinationMarker = await BitmapDescriptor.fromAssetImage(_configuration, "images/destination.png");

    setState(() {
      _markers = [
      Marker(
        markerId: MarkerId("origin1"),
        position: _originLocation1,
        icon: originMarker,
        draggable: false,
      ),
      Marker(
        markerId: MarkerId("destination1"),
        icon: destinationMarker,
        position: _destinationLocation1,
        draggable: false,
      ),
      Marker(
        markerId: MarkerId("origin2"),
        position: _originLocation2,
        icon: originMarker,
        draggable: false,
      ),
      Marker(
        markerId: MarkerId("destination2"),
        icon: destinationMarker,
        position: _destinationLocation2,
        draggable: false,
      ),
    ];

    });
  }
}
