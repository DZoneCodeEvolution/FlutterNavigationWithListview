import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/home_page.dart';
import 'package:myfirstapp/pages/login.dart';
import 'package:myfirstapp/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Constants.prefs.getBool("logedIn") == true ? MyApp() : Login(),
      theme: ThemeData(primarySwatch: Colors.pink),
      routes: {
        Login.routeName: (context) => Login(),
        MyApp.routeName: (context) => MyApp(),
      },
    );
  }
}
