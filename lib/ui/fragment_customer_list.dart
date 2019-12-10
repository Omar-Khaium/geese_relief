import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/Customer_model.dart';
import 'package:flutter_grate_app/widgets/customer_list_ui.dart';

class CustomerListFragment extends StatefulWidget {
  @override
  _CustomerListFragmentState createState() => _CustomerListFragmentState();
}

class _CustomerListFragmentState extends State<CustomerListFragment> {
  List<Customer> customers = [
    Customer("Tomal", "8858 Montegomery Rd \n Cininita, OH 45677", "01737935210", "tomal@mail.com"),
    Customer("xsdssd", "Nikunja-2", "01737935210", "tomal@mail.com"),
    Customer("Tomdfdsfal", "Nikunja-2", "01737935210", "tomal@mail.com"),
    Customer("gdgfgf", "Nikunja-2", "01737935210", "tomal@mail.com"),
    Customer("hhgrd", "Nikunja-2", "01737935210", "tomal@mail.com"),
    Customer("tretret", "Nikunja-2", "01737935210", "tomal@mail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: customers.length,
            itemBuilder: (_, index) {
              return CustomerList(
                customers[index].customer_name,
                customers[index].customer_address,
                customers[index].customer_contact,
                customers[index].customer_email,
              );
            }),
      ),
    );
  }
}
