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
  Widget build(BuildContext context) {
    bool _factPointer = false;
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
                //tried to make a text appear after pressing the button. Didn't work out :(
                //so I changed factPointer to 'true' on declaring "visible" tag for Text
                onPressed: () => {
                      setState(() {
                        _factPointer = true;
                        print(_factPointer);
                      })
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
                      //supposed to make the text visible after pressing the button
                      visible: _factPointer,
                      child: new Text("Your cat fact is on the other page!")));
            }),
            Builder(builder: (context) {
              return Text('Your cat fact is on the other page!');
            }),
          ],
        ),
      ),
    );
  }
}
