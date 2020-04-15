import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';

class NewCustomerUI extends StatefulWidget {
  @override
  _NewCustomerUIState createState() => _NewCustomerUIState();
}

class _NewCustomerUIState extends State<NewCustomerUI> {
  TextEditingController _controller = new TextEditingController();
  int selectedCustomer;
  var _formKey = GlobalKey<FormState>();

  List<Customer> customers = [
    new Customer("1100 King Street", "Route 1 - Ryan Marut", 145, 2, 0),
    new Customer("226 upper Shad Road", "Route 5 - Sharee", 72, 13, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("New Customer"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: <Widget>[
            DropdownButtonFormField(
              isDense: true,
              validator: (index) =>
                  selectedCustomer == 0 || selectedCustomer == null
                      ? "Required"
                      : null,
              decoration: new InputDecoration(
                  labelText: "Customer",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  alignLabelWithHint: false,
                  filled: true,
                  fillColor: Colors.black12,
                  isDense: true),
              items: List.generate(customers.length, (index) {
                return DropdownMenuItem(
                    value: index, child: Text(customers[index].name));
              }),
              onChanged: (index) {
                FocusScope.of(context).requestFocus(FocusNode());
                selectedCustomer = index;
              },
              value: selectedCustomer,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Note",
                  labelStyle: Theme.of(context)
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
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  child: Text(
                    "Save",
                    style: Theme.of(context)
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
