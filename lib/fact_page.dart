import 'package:flutter/material.dart';
import './main.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class Fact extends StatefulWidget {
  @override
  FactState createState() => FactState();
}

class FactState extends State<Fact> {
  final url = "https://catfact.ninja/fact";

  var postJson = '';

  void fetchPost() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      final Map map = jsonData;
      print(map['fact']);
      print(jsonData);

      setState(() {
        postJson = map['fact'];

        print(postJson);
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  void display() {}

  void _showFact() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Your cat fact is...'),
              backgroundColor: Colors.orange[600],
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text("${postJson}\n\n",
                    style: TextStyle(
                      color: Colors.orange[600],
                      fontSize: 25,
                    )))),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CatFact app'),
        backgroundColor: Colors.orange[600],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _showFact)
        ],
      ),
      body: MyCustomForm(),
    );
  }
}
