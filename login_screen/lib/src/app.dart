import 'package:flutter/material.dart';
import '../widgets/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Please Login:'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
