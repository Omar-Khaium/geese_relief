import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';

class CustomerFragmentState extends StatefulWidget {
  @override
  _CustomerFragmentStateState createState() => _CustomerFragmentStateState();
}

class _CustomerFragmentStateState extends State<CustomerFragmentState> {
  bool isSearchActive = false;

  List<Customer> customers = [
    new Customer("1100 King Street", "Route 1 - Ryan Marut", 145, 0, 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEEF8),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon:
                        isSearchActive ? Icon(Icons.close) : Container(),
                    hintText: "Search",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.grey),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(),
                itemCount: customers.length,
                padding: EdgeInsets.all(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
