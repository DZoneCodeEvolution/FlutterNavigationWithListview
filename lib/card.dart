import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
    MyCard({
      Key key,
      @required this.mytext,
      @required TextEditingController name,
    }) : _name = name ,super(key:key);
    final String mytext;
    final TextEditingController _name;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/bg.jpg", height: 300, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(mytext,
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
                  ,hintText: "Enter some Text", labelText: "Name"),
            ),
          )
        ],
      ),
    );
  }
}
