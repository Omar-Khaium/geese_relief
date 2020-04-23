import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/utils/widget_user_address_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../constraints.dart';

class EditUserUI extends StatefulWidget {
  final User user;

  EditUserUI(this.user);

  @override
  _EditUserUIState createState() => _EditUserUIState();
}

class _EditUserUIState extends State<EditUserUI> {
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _latitudeController = new TextEditingController();
  TextEditingController _longitudeController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _zipController = new TextEditingController();
  int selectedRole;
  int selectedGender = 0;
  var _formKey = GlobalKey<FormState>();

  LatLng currentLocation = LatLng(currentLatitude, currentLongitude);

  Widget mapPreview;

  List<String> _roles = [
    "Adming",
    "Employee",
    "Customer",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: AppBar(
        title: Text("Edit User"),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        elevation: 4,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: <Widget>[
            DropdownButtonFormField(
              isDense: true,
              validator: (index) =>
              selectedRole == 0 || selectedRole == null ? "Required" : null,
              decoration: new InputDecoration(
                  labelText: "Role",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  alignLabelWithHint: false,
                  filled: true,
                  fillColor: Colors.black12,
                  isDense: true),
              items: List.generate(_roles.length, (index) {
                return DropdownMenuItem(
                    value: index, child: Text(_roles[index]));
              }),
              onChanged: (index) {
                FocusScope.of(context).requestFocus(FocusNode());
                selectedRole = index;
              },
              value: selectedRole,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _firstNameController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "First Name",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _lastNameController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Last Name",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Phone",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Email",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Gender",
                  style: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CupertinoSlidingSegmentedControl(
                  children: <int, Widget>{
                    0: Padding(
                      child: Text("Male"),
                      padding: EdgeInsets.all(8),
                    ),
                    1: Padding(
                      child: Text("Female"),
                      padding: EdgeInsets.all(8),
                    ),
                  },
                  onValueChanged: (int newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  groupValue: selectedGender,
                  backgroundColor: CupertinoColors.tertiarySystemFill,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Username",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Password",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Address",
                  style: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.map,
                          size: 18,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (context) =>
                                  UserAddressMapWidget(
                                    markerLocation: (position) {
                                      setState(() {
                                        currentLocation = position;
                                        _latitudeController.text =
                                            position.latitude.toStringAsFixed(
                                                6);
                                        _longitudeController.text =
                                            position.longitude.toStringAsFixed(
                                                6);
                                      });
                                    },
                                    searchResult: (addresses) async {
                                      for(AddressComponent component in addresses) {
                                        switch (component.types[0]){
                                          case "locality": {
                                            _cityController.text = component.longName;
                                          } break;
                                          case "administrative_area_level_1": {
                                            _stateController.text = component.shortName;
                                          } break;
                                          case "postal_code": {
                                            _zipController.text = component.longName;
                                          } break;
                                        }
                                      }
                                      /*_cityController.text = addresses[3].longName;
                                      _zipController.text = addresses[7].longName;*/
                                    },
                                    currentPosition: currentLocation,
                                  ))),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _latitudeController,
              keyboardType:
              TextInputType.numberWithOptions(decimal: true, signed: true),
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Latitude",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _longitudeController,
              keyboardType:
              TextInputType.numberWithOptions(decimal: true, signed: true),
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Longitude",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _cityController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "City",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _stateController,
              keyboardType: TextInputType.text,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "State",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _zipController,
              keyboardType: TextInputType.number,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              style: Theme
                  .of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Zip",
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional"),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                color: Theme
                    .of(context)
                    .primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  child: Text(
                    "Update",
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
