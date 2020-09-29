import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myfirstapp/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myfirstapp/pages/login.dart';
import 'package:myfirstapp/util/constants.dart';

class MyApp extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    print(res);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to DZone',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to DZone'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Constants.prefs.setBool("logedIn", false);
                  Navigator.pushNamed(context, Login.routeName);
                })
          ],
        ),
        body: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("ID :${data[index]["id"]}"),
                    leading: Image.network(data[index]["url"]),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}
