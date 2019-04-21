import 'package:flutter/material.dart';
import 'dart:collection';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';

class TopList extends StatelessWidget {
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      onRefresh: () => bloc.resfreshTopList(),
      child: StreamBuilder<UnmodifiableListView<ItemModel>>(
        stream: bloc.itemsList,
        builder: (BuildContext context,
            AsyncSnapshot<UnmodifiableListView<ItemModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return buildItem(snapshot.data[index], index);
              });
        },
      ),
    );
  }

  Widget buildItem(ItemModel item, int index) {
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
