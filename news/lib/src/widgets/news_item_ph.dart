import 'package:flutter/material.dart';
import '../models/item_model.dart';

class NewsItemPlaceholder extends StatelessWidget {
  final ItemModel item;
  final int index;

  NewsItemPlaceholder(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(index.toString()),
      leading: CircleAvatar(
        child: Text('${index + 1}', style: TextStyle(fontSize: 14)),
        radius: 16,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          greyBox(40, 20),
          greyBox(30, 20),
        ],
      ),
      subtitle: greyBox(10, 20),
      trailing: Column(
        children: <Widget>[
          Icon(Icons.comment),
          greyBox(10, 20),
        ],
      ),
    );
  }

  Widget greyBox(double width, double height) {
    return Container(
      color: Colors.blueGrey[100],
      width: width,
      height: height,
    );
  }
}
