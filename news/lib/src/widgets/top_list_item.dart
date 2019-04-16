import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';

class TopListItem extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;

  TopListItem(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    return FutureBuilder<ItemModel>(
      key: Key(snapshot.data[index].toString()),
      future: bloc.getNewsItem(snapshot.data[index]),
      builder: (BuildContext context, AsyncSnapshot<ItemModel> itemSnapshot) {
        return itemSnapshot.hasData
            ? buildItem(itemSnapshot.data, index)
            : Text('Loading...');
      },
    );
  }

  Widget buildItem(ItemModel item, int index) {
    return ListTile(
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
