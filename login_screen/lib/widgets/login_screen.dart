import 'package:flutter/material.dart';
import '../mixins/input-validations.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with input_validations {
  final formkey = GlobalKey<FormState>();
  bool _validate = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
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
        autovalidate: _validate,
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
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) => email = value,
    );
  }

  passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Strong password',
        icon: Icon(Icons.security),
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) => password = value,
    );
  }

  submitButton() {
    return FlatButton(
      child: Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        setState(() => _validate = true);
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('Saved email as $email and password as $password.');
        } else {
          print('Not valid.');
        }
      },
      color: Colors.blue,
    );
  }
}
