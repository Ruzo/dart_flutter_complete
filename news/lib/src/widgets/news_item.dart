import 'package:flutter/material.dart';
import '../models/item_model.dart';

class NewsItem extends StatelessWidget {
  final ItemModel item;
  final int index;

  NewsItem(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(index.toString()),
      leading: CircleAvatar(
        child: Text('${index + 1}', style: TextStyle(fontSize: 14)),
        radius: 16,
      ),
      title: Text(item.title),
      subtitle: Text('${item.score}'),
      trailing: Column(
        children: <Widget>[
          Icon(Icons.comment),
          Text('${item.descendants}'),
        ],
      ),
    );
  }
}
