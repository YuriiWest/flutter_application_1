import 'package:flutter/material.dart';
import './fact_page.dart';
import './form_body.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// without MaterialApp causing "Navigator operation requested with a context
// that does not include a Navigator" error. Work on this isssue is in progress...

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showFact() {
    Navigator.of(context).push(MaterialPageRoute(builder: (buildContext) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Your cat fact is...'),
              backgroundColor: Colors.orange[600],
            ),
            body: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Fact())),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('CatFact app'),
          backgroundColor: Colors.orange[600],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _showFact,
            )
          ],
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}
