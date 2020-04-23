import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordUI extends StatefulWidget {
  @override
  _ChangePasswordUIState createState() => _ChangePasswordUIState();
}

class _ChangePasswordUIState extends State<ChangePasswordUI> {
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  bool _passwordObscure = true;
  bool _newPasswordObscure = true;
  bool _confirmPasswordObscure = true;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Change Password"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          physics: ScrollPhysics(),
          children: <Widget>[
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _passwordObscure,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Password",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional",
                  suffixIcon: IconButton(
                    icon: Icon(_passwordObscure ? Icons.visibility : Icons.visibility_off, size: 18,),
                    onPressed: (){
                      setState(() {
                        _passwordObscure = !_passwordObscure;
                      });
                    },
                  )
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _newPasswordController,
              keyboardType: TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _newPasswordObscure,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "New Password",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional",
                  suffixIcon: IconButton(
                    icon: Icon(_newPasswordObscure ? Icons.visibility : Icons.visibility_off, size: 18,),
                    onPressed: (){
                      setState(() {
                        _newPasswordObscure = !_newPasswordObscure;
                      });
                    },
                  )
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _confirmPasswordObscure,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Colors.black12,
                  labelText: "Confirm Password",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  hintText: "optional",
                  suffixIcon: IconButton(
                    icon: Icon(_confirmPasswordObscure ? Icons.visibility : Icons.visibility_off, size: 18,),
                    onPressed: (){
                      setState(() {
                        _confirmPasswordObscure = !_confirmPasswordObscure;
                      });
                    },
                  )
              ),
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
