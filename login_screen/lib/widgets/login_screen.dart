import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Padding(padding: EdgeInsets.all(10)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
        icon: Icon(Icons.email),
      ),
    );
  }

  passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Strong password',
        icon: Icon(Icons.security),
      ),
    );
  }

  submitButton() {
    return FlatButton(
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => {
            formkey.currentState.reset(),
          },
      color: Colors.blue,
    );
  }
}
