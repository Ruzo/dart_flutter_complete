import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          emailField(),
          Padding(padding: EdgeInsets.all(10)),
          passwordField(),
          Padding(padding: EdgeInsets.all(10)),
          submitButton(),
        ],
      ),
    );
  }
}

Widget emailField() {
  return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'you@example',
            errorText: snapshot.error,
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
          onChanged: bloc.addToEmail,
        );
      });
}

Widget passwordField() {
  return StreamBuilder<String>(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Say no to 123456, abcdef, password, etc...',
            errorText: snapshot.error,
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          ),
          onChanged: bloc.addToPassword,
        );
      });
}

Widget submitButton() {
  return FlatButton(
    child: Text('Submit'),
    color: Colors.blue,
    textColor: Colors.white,
    onPressed: () => {},
  );
}
