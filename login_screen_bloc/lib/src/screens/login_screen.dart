import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bloc bloc = Provider.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Padding(padding: EdgeInsets.all(10)),
          passwordField(bloc),
          Padding(padding: EdgeInsets.all(10)),
          submitButton(bloc),
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
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

Widget passwordField(Bloc bloc) {
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

Widget submitButton(Bloc bloc) {
  return StreamBuilder<Map>(
      stream: bloc.validated,
      builder: (context, snapshot) {
        return FlatButton(
          child: Text('Submit'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed:
              snapshot.hasData ? () => bloc.handleSubmit(snapshot.data) : null,
        );
      });
}
