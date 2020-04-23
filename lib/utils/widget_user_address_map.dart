import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../constraints.dart';

class UserAddressMapWidget extends StatefulWidget {
  ArgumentCallback<LatLng> markerLocation;
  ArgumentCallback<List<AddressComponent>> searchResult;
  LatLng currentPosition;

  UserAddressMapWidget({this.markerLocation, this.searchResult, this.currentPosition});

  @override
  _UserAddressMapWidgetState createState() => _UserAddressMapWidgetState();
}

class _UserAddressMapWidgetState extends State<UserAddressMapWidget> {

  GoogleMapController _controller;
  GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: MAP_API_TOKEN);
  TextEditingController _addressController = new TextEditingController();

  Marker marker;

  @override
  void initState() {
    super.initState();
    if(widget.currentPosition==null)
      widget.currentPosition = LatLng(currentLatitude, currentLongitude);
  }

  @override
  Widget build(BuildContext context) {
    initMarker();

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose A Location"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Text("Done"),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapToolbarEnabled: true,
            indoorViewEnabled: false,
            mapType: MapType.normal,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
              target: widget.currentPosition,
              zoom: 17.5,
            ),
            onMapCreated: mapCreated,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            markers: Set.of([marker]),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              color: Colors.white,
              elevation: 16,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              child: TextField(
                onTap: () async {
                  Prediction prediction = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: MAP_API_TOKEN,
                      mode: Mode.overlay,
                      language: "en",
                      components: [Component(Component.country, "us")]);
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (prediction != null) {
                    PlacesDetailsResponse detail =
                    await _places.getDetailsByPlaceId(prediction.placeId);

                    _addressController.text = detail.result.formattedAddress;
                    widget.currentPosition = LatLng(detail.result.geometry.location.lat,
                        detail.result.geometry.location.lng);
                    setState(() {
                      widget.markerLocation(widget.currentPosition);
                      widget.searchResult(detail.result.addressComponents);
                      initMarker();
                      _controller
                          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                        target: widget.currentPosition,
                        zoom: 17.5,
                      )));
                    });
                  }
                },
                controller: _addressController,
                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                    contentPadding: EdgeInsets.all(14),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _addressController.text.isEmpty ? Container() :
                        IconButton(
                          icon: Icon(Icons.clear, size: 18,),
                          onPressed: (){
                            setState(() {
                              _addressController.text = "";
                            });
                          },
                        )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void mapCreated(controller) {
    _controller = controller;

    if (widget.currentPosition == null)
      widget.currentPosition = LatLng(currentLatitude, currentLongitude);
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: widget.currentPosition,
      zoom: 17.5,
    )));
  }

  void initMarker() {
    marker = new Marker(
        markerId: MarkerId("1243"),
        draggable: true,
        visible: true,
        position: widget.currentPosition,
        onDragEnd: (latlng) {
          widget.markerLocation(latlng);
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: widget.currentPosition,
            zoom: 17.5,
          )));
        });
  }
}
