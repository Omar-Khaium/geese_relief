import 'package:flutter/material.dart';
import 'package:geese_relief/constraints.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/model/hive/search_suggestion.dart';
import 'package:geese_relief/model/user.dart';
import 'package:geese_relief/utils/widget_customer_list_tile.dart';
import 'package:geese_relief/utils/widget_user_list_tile.dart';
import 'package:hive/hive.dart';

class SearchWidget extends SearchDelegate<String> {
  Box<SearchSuggestion> suggestionBox;
  List<SearchSuggestion> suggestions = [];
  List<SearchSuggestion> previews = [];
  final int searchType;

  SearchWidget(this.searchType);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    insertKeyword(query);
    return ListView.builder(
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        switch (searchType) {
          case 0:
            {
              return  CustomerListTile(
                      Customer("1100 King Street", "Route 1 - Ryan Marut", 145,
                          2, 0),
                    );
            }
            break;
          case 1:
          case 2:
          case 3:
            {
              return UserListTile(
                User(
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
                showBanner: true,
              );
            }
            break;
          default:
            {
              return index == 0
                  ? Banner(
                      location: BannerLocation.topEnd,
                      child: UserListTile(
                        User(
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
                        showBanner: true,
                      ),
                      message: "User",
                      color: Theme.of(context).primaryColor,
                      textStyle: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Colors.black),
                    )
                  : CustomerListTile(
                      Customer("1100 King Street", "Route 1 - Ryan Marut", 145,
                          2, 0),
                      showBanner: true,
                    );
            }
        }
      },
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestionBox = Hive.box("search_suggestions");

    suggestions = [];
    previews = [];

    for (int position = 0; position < suggestionBox.length; position++) {
      SearchSuggestion suggestion = suggestionBox.getAt(position);
      if (!suggestion.isNew) {
        if (searchType == SearchType.none)
          previews.add(suggestionBox.getAt(position));
        else {
          if (searchType == suggestion.type)
            previews.add(suggestionBox.getAt(position));
        }
      }
    }

    for (int position = 0; position < suggestionBox.length; position++) {
      SearchSuggestion suggestion = suggestionBox.getAt(position);
      if (!suggestion.isNew &&
          suggestion.keyword.toLowerCase().startsWith(query.toLowerCase()))
        suggestions.add(suggestionBox.getAt(position));
    }

    return suggestions.length == 0
        ? Container()
        : ListView.builder(
            itemBuilder: (context, index) {
              SearchSuggestion suggestion =
                  query.isEmpty ? previews[index] : suggestions[index];
              return ListTile(
                onTap: () {
                  query = suggestion.keyword;
                  showResults(context);
                },
                dense: true,
                leading: Icon(query.isEmpty ? Icons.history : Icons.search),
                title: RichText(
                  text: TextSpan(
                      text: suggestion.keyword.substring(0, query.length),
                      style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: suggestion.keyword.substring(
                              query.length, suggestion.keyword.length),
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.normal),
                        ),
                      ]),
                ),
              );
            },
            itemCount: query.isEmpty ? previews.length : suggestions.length,
          );
  }

  insertKeyword(String query) async {
    if (query.isEmpty) return;
    for (SearchSuggestion suggestion in suggestions) {
      if (query == suggestion.keyword) return;
    }
    int flag =
        await suggestionBox.add(SearchSuggestion(searchType, query, false));
    flag = flag;
  }
}
