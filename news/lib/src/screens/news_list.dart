import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    bloc.getTopNews(false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Techy News'),
      ),
      body: StreamBuilder(
        stream: bloc.topList,
        builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return FutureBuilder<ItemModel>(
                key: Key(snapshot.data[index].toString()),
                future: itemDetails(bloc, snapshot.data[index]),
                builder: (BuildContext context,
                    AsyncSnapshot<ItemModel> itemSnapshot) {
                  return itemSnapshot.hasData
                      ? buildItem(itemSnapshot.data, index)
                      : Text('Loading...');
                },
              );
            },
          );
        },
      ),
    );
  }
}

Future<ItemModel> itemDetails(StoriesBloc bloc, int id) async {
  final details = await bloc.getNewsItem(id);
  return details;
}

Widget buildItem(ItemModel item, int index) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Text('$index. ${item.title}'),
  );
}
