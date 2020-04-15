import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/ui/ui_new_customer.dart';
import 'package:geese_relief/utils/widget_customer_list_tile.dart';

class CustomerFragmentState extends StatefulWidget {
  @override
  _CustomerFragmentStateState createState() => _CustomerFragmentStateState();
}

class _CustomerFragmentStateState extends State<CustomerFragmentState> {
  List<Customer> customers = [
    new Customer("1100 King Street", "Route 1 - Ryan Marut", 145, 2, 0),
    new Customer("226 upper Shad Road", "Route 5 - Sharee", 72, 13, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => NewCustomerUI(), fullscreenDialog: true)),
        label: Text("New"),
        icon: Icon(Icons.person_add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Customer customer = customers[index];
          return CustomerListTile(customer);
        },
        itemCount: customers.length,
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
