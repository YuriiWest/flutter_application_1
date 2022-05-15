import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  final url = "https://catfact.ninja/fact";

  var postJson = '';

  void fetchPost() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      final Map map = jsonData;

      setState(() {
        postJson = map['fact'];
      });
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Text(postJson);
  }
}
