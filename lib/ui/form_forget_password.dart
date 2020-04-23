import 'package:flutter/material.dart';

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {

  TextEditingController _emailController = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              height: 120,
              child: Card(
                elevation: 8,
                child: Center(
                  child: ListView(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.send,
                          cursorColor: Colors.grey,
                          autocorrect: false,
                          validator: (val)=> _emailController.text.isEmpty ? "required" : null,
                          style: Theme.of(context).textTheme.body1,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: Theme.of(context).textTheme.body1,
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            hintText: "jhon@mail.com",
                            hintStyle: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey.shade400),
                            isDense: true,
                            hasFloatingPlaceholder: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade400)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 64,
            right: 64,
            bottom: 0,
            child: MaterialButton(
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  setState(() {

                  });
                }
              },
              color: Theme.of(context).primaryColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(72),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "SEND",
                  style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
