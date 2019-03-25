import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login Screen With BLOC',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Please Login:'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
