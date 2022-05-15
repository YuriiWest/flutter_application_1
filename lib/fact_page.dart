import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Fact extends StatefulWidget {
  const Fact({Key? key}) : super(key: key);

  @override
  FactState createState() => FactState();
}

class FactState extends State<Fact> {
  final url = "https://catfact.ninja/fact";

  var postJson = '';

  void fetchPost() async {
    final response = await get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    final Map map = jsonData;

    setState(() {
      postJson = map['fact'];
    });
  }

  void greeting() {
    const Text('Press the button!');
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Text("$postJson\n\n",
        style: TextStyle(
          color: Colors.orange[600],
          fontSize: 25,
        ));
  }
}
