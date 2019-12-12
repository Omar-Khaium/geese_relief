import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/co_ordinate_positiond_customer_details.dart';
import 'package:flutter_grate_app/widgets/text_style.dart';

class CustomerDetails extends StatefulWidget {
  @override
  _customerDetailsState createState() => _customerDetailsState();
}

class _customerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 26),
                  child: Text("Customer Detail",
                      style: customWelcomeStyle(Colors.black)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 500,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    CustomerDetailsCard()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
