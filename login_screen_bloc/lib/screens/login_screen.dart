import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          emailField(),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          passwordField(),
        ],
      ),
    );
  }
}

Widget emailField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Email',
      hintText: 'you@example',
      enabledBorder: OutlineInputBorder(),
    ),
  );
}

Widget passwordField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Password',
      hintText: 'Not 123456, abcdef or password',
      enabledBorder: OutlineInputBorder(),
    ),
  );
}
