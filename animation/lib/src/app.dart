import 'package:flutter/material.dart';
import 'widgets/cat.dart';

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pussycat in a box'),
        ),
        body: Center(
          child: Cat(),
        ),
      ),
    );
  }
}
