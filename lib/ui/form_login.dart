import 'package:flutter/material.dart';
import 'package:geese_relief/ui/ui_forget_password.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscure = true;
  bool isRemembered = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312,
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              height: 292,
              child: Card(
                elevation: 8,
                child: Center(
                  child: ListView(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.grey,
                          autocorrect: false,
                          validator: (val) =>
                              _emailController.text.isEmpty ? "required" : null,
                          style: Theme.of(context).textTheme.body1,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: Theme.of(context).textTheme.body1,
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            hintText: "jhon@mail.com",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.grey.shade400),
                            isDense: true,
                            hasFloatingPlaceholder: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.grey,
                          style: Theme.of(context).textTheme.body1,
                          autocorrect: false,
                          validator: (val) => _passwordController.text.isEmpty
                              ? "required"
                              : null,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: Theme.of(context).textTheme.body1,
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              hintText: "******",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: Colors.grey.shade400),
                              isDense: true,
                              hasFloatingPlaceholder: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 18,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                              )),
                          obscureText: isObscure,
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (flag) {
                          setState(() {
                            isRemembered = flag;
                          });
                        },
                        value: isRemembered,
                        checkColor: Colors.white,
                        dense: true,
                        title: Text(
                          "Remember Me",
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPasswordState())),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Forget Password",
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                        ),
                      )
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
                if (_formKey.currentState.validate()) {}
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(72),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.subhead.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
