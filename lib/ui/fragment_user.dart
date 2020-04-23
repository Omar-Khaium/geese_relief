import 'package:flutter/material.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/ui/ui_new_user.dart';
import 'package:geese_relief/utils/widget_search.dart';
import 'package:geese_relief/utils/widget_user_list_tile.dart';

import '../constraints.dart';

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

  final List<String> searchOptions = [
    "Search By Name",
    "Search By Username",
    "Search By Phone",
  ];

  int searchType;

  String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = searchOptions[0];
    searchType = SearchType.byName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          new MaterialPageRoute(
              builder: (context) => NewUserUI(), fullscreenDialog: true),
        ),
        label: Text("New"),
        icon: Icon(Icons.person_add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(
        title: Text("Users"),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchWidget(searchType));
            },
          ),
          PopupMenuButton<String>(
            onSelected: (option) {
              setState(() {
                switch (searchOptions.indexOf(option)) {
                  case 0:
                    {
                      searchType = SearchType.byName;
                      selectedOption = searchOptions[0];
                    }
                    break;
                  case 1:
                    {
                      searchType = SearchType.byUsername;
                      selectedOption = searchOptions[1];
                    }
                    break;
                  case 2:
                    {
                      searchType = SearchType.byPhone;
                      selectedOption = searchOptions[2];
                    }
                    break;
                }
              });
            },
            itemBuilder: (BuildContext context) {
              return searchOptions.map((item) {
                return PopupMenuItem<String>(
                  enabled: item == selectedOption ? false : true,
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        physics: ScrollPhysics(),
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
