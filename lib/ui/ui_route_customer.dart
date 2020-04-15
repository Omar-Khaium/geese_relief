import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/utils/widget_route_customer_list_tile.dart';

class RouteCustomers extends StatefulWidget {
  final String route;

  RouteCustomers(this.route);

  @override
  _RouteCustomersState createState() => _RouteCustomersState();
}

class _RouteCustomersState extends State<RouteCustomers> {
  List<Customer> customers = [
    new Customer("1100 King Street", "Route 1 - Ryan Marut", 145, 2, 0),
    new Customer("226 upper Shad Road", "Route 5 - Sharee", 72, 13, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.route),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemBuilder: (context, index) {
          Customer customer = customers[index];
          return RouteCustomerListTile(customer);
        },
        itemCount: customers.length,
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
