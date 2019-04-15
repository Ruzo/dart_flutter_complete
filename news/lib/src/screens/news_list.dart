import 'package:flutter/material.dart';
import '../widgets/top_list.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Techy News'),
      ),
      body: TopList(),
    );
  }
}
