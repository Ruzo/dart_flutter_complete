import 'package:flutter/material.dart';
// import 'dart:collection';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';
import './news_item.dart';
import './news_item_ph.dart';

class TopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      onRefresh: () => bloc.resfreshTopList(),
      child: StreamBuilder<List<int>>(
          stream: bloc.topList,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                    itemCount: snapshot.data.length,
                    separatorBuilder: (context, _) => Divider(),
                    itemBuilder: (context, int index) {
                      return FutureBuilder<ItemModel>(
                          key: Key(snapshot.data[index].toString()),
                          future: bloc.getNewsItem(snapshot.data[index]),
                          builder: (context, itemSnapshot) {
                            switch (itemSnapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.active:
                              case ConnectionState.waiting:
                                print(
                                    '${itemSnapshot.connectionState} for $index');
                                return NewsItemPlaceholder(
                                    ItemModel.placeHolder(snapshot.data[index]),
                                    index);
                              case ConnectionState.done:
                                return NewsItem(itemSnapshot.data, index);
                            }
                          });
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }

  // Widget buildItem(ItemModel item, int index) {
  //   print('Building row $index');
  //   return ListTile(
  //     key: Key(index.toString()),
  //     leading: CircleAvatar(
  //       child: Text('${index + 1}', style: TextStyle(fontSize: 14)),
  //       radius: 16,
  //     ),
  //     title: Text(item.title),
  //     subtitle: Text('${item.score}'),
  //     trailing: Column(
  //       children: <Widget>[
  //         Icon(Icons.comment),
  //         Text('${item.descendants}'),
  //       ],
  //     ),
  //   );
  // }
}
