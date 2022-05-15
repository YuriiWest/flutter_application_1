import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  bool _factPointer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Do you like cats?',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: OutlinedButton(
                  //making text under button visible when onPressed is triggered
                  onPressed: () {
                    setState(() {
                      _factPointer = true;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      primary: Colors.orange[500],
                      shape: const StadiumBorder(),
                      fixedSize: const Size(300, 80),
                      textStyle: const TextStyle(fontSize: 24)),
                  child: const Text('Get a cat fact'))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Visibility(
                  visible:
                      _factPointer, //making text visible with onPressed func
                  child: const Text("Your cat fact is on the other page!"))),
        ],
      ),
    );
  }
}
