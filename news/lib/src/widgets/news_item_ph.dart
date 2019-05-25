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
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.blueGrey[100],
            width: 40.0,
            height: 20.0,
          ),
          Container(
            color: Colors.blueGrey[100],
            width: 30.0,
            height: 20.0,
          ),
        ],
      ),
      subtitle: Container(
        color: Colors.blueGrey[100],
        width: 10.0,
        height: 20.0,
      ),
      trailing: Column(
        children: <Widget>[
          Icon(Icons.comment),
          Container(
            color: Colors.blueGrey[100],
            width: 10.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
