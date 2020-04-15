import 'package:flutter/material.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/utils/widget_user_list_tile.dart';

class UserFragmentState extends StatefulWidget {
  @override
  _UserFragmentStateState createState() => _UserFragmentStateState();
}

class _UserFragmentStateState extends State<UserFragmentState> {
  List<User> users = [
    new User(
        "c_172708943",
        "Lora de Bree",
        "2222222222",
        "rdebreeus@gmail.com",
        "Female",
        "	Route 1 - Ryan Marut",
        0,
        0,
        "Address 1\, Street",
        "City",
        "State",
        "Zip",
        "Customer"),
    new User(
        "Dan",
        "Dan Clancey",
        "4752239202",
        "snakechaser1963@gmail.com",
        "Male",
        "	Route 1 - Ryan Marut",
        0,
        0,
        "Address 1\, Street",
        "City",
        "State",
        "Zip",
        "Employee"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("New"),
        icon: Icon(Icons.person_add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          User user = users[index];
          return UserListTile(user);
        },
        itemCount: users.length,
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
