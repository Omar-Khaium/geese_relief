import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constraints.dart';


class GoogleMapWidget extends StatelessWidget {

  GoogleMapController _controller;

  var _geoLocator = Geolocator();
  var _locationOptions =
  LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);


  @override
  Widget build(BuildContext context) {
    listenToLocationChange();

    return GoogleMap(
      buildingsEnabled: false,
      mapToolbarEnabled: false,
      indoorViewEnabled: false,
      compassEnabled: false,
      trafficEnabled: false,
      mapType: MapType.normal,
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      scrollGesturesEnabled: false,
      zoomGesturesEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(currentLatitude, currentLongitude),
        zoom: 18,
      ),
      onMapCreated: mapCreated,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
    );
  }



  void mapCreated(controller) {
    _controller = controller;
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLatitude, currentLongitude),
      zoom: 17.5,
    )));
  }

  void listenToLocationChange() async {
    _geoLocator.getPositionStream(_locationOptions).listen((Position position) {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;

      if (_controller != null) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(currentLatitude, currentLongitude),
              zoom: 17.5,
            ),
          ),
        );
      }
    });
  }
}