import 'package:flutter/material.dart';
// import 'dart:collection';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';
// import '../resources/repository.dart';

class TopList extends StatefulWidget {
  @override
  _TopListState createState() => _TopListState();
}

class _TopListState extends State<TopList> {
  // List<int> _topList;
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    bloc.getTopNews();
    return RefreshIndicator(
      onRefresh: () => bloc.resfreshTopList(),
      child: StreamBuilder<List<int>>(
          stream: bloc.topList,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemBuilder: (context, int index) {
                      final Future<ItemModel> fetchedItem =
                          bloc.getNewsItem(snapshot.data[index]);
                      return FutureBuilder<ItemModel>(
                          key: Key(snapshot.data[index].toString()),
                          future: fetchedItem,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? buildItem(snapshot.data, index)
                                : Text('Loading...');
                          });
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
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
