import "package:flutter/material.dart";
import 'package:myfirstapp/pages/home_page.dart';
import 'package:myfirstapp/util/constants.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _usercontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usercontroller,
                  //validator: (s) async {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter Username", labelText: "Username"),
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  //validator: (s){},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                RaisedButton(
                  onPressed: () {
                    Constants.prefs.setBool("logedIn", true);
                    formKey.currentState.validate();
                    Navigator.pushNamed(context, MyApp.routeName);
                  },
                  child: Text('Sign In'),
                  color: Colors.yellow,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
