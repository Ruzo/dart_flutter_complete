import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
          ],
        ),
      ),
    );
  }
}

emailField() {
  return Text('Email Field');
}

passwordField() {
  return Text('Password Field');
}
