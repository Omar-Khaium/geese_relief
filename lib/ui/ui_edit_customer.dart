import 'package:flutter/material.dart';
import 'package:geese_relief/model/customer.dart';

class EditCustomerUI extends StatefulWidget {
  final Customer customer;

  EditCustomerUI(this.customer);

  @override
  _EditCustomerUIState createState() => _EditCustomerUIState();
}

class _EditCustomerUIState extends State<EditCustomerUI> {
  TextEditingController _controller = new TextEditingController();
  int selectedCustomer;
  var _formKey = GlobalKey<FormState>();
  bool _isCheckedIn = false;

  List<Customer> customers = [
    new Customer("1100 King Street", "Route 1 - Ryan Marut", 145, 2, 0),
    new Customer("226 upper Shad Road", "Route 5 - Sharee", 72, 13, 1),
  ];

  @override
  void initState() {
    for (int i = 0; i < customers.length; i++) {
      if (widget.customer.name == customers[i].name) selectedCustomer = i;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.customer.name),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: DropdownButtonFormField(
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
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextFormField(
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
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                "Is Checked-in",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              selected: _isCheckedIn,
              value: _isCheckedIn,
              onChanged: (flag) {
                setState(() {
                  _isCheckedIn = flag;
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
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
