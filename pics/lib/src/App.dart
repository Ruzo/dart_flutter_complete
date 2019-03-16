import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import '../models/Image.dart';
import '../widgets/image-list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<ImageModel> imageList = new List();

  int randomNum() {
    final int number = new Random().nextInt(4999) + 1;
    return number + 1;
  }

  void fetchImage() {
    int pic = randomNum();
    String getURL = "http://jsonplaceholder.typicode.com/photos/$pic";

    get(getURL).then((data) => {
          setState(() {
            imageList.add(ImageModel.fromJson(jsonDecode(data.body)));
          }),
          print(imageList.toString())
        });
  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Let's see some pics!"),
      ),
      body: Images(imageList),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        tooltip: "Add an image",
        child: Icon(Icons.add),
      ),
    ));
  }
}
