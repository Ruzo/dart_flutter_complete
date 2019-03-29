import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network('https://i.imgur.com/QwhZRyL.png'),
    );
  }
}
