// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import './fact_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Fact(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => new _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController likingController = TextEditingController();
  bool _factPointer = false;
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: likingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Do you like cats?',
                ),
              ),
            ),
            new OutlinedButton(
                //making under button visible when onPressed is triggered
                onPressed: () {
                  setState(() {
                    _factPointer = true;
                  });
                },
                style: OutlinedButton.styleFrom(
                    primary: Colors.orange[500],
                    shape: StadiumBorder(),
                    fixedSize: const Size(300, 80),
                    textStyle: const TextStyle(fontSize: 24)),
                child: Text('Get a cat fact')),
            Builder(builder: (context) {
              return new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: new Visibility(
                      visible:
                          _factPointer, //making text visible with onPressed func
                      child: new Text("Your cat fact is on the other page!")));
            }),
          ],
        ),
      ),
    );
  }
}
