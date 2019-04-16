import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import 'top_list_item.dart';

class TopList extends StatelessWidget {
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    bloc.getTopNews(true);
    return StreamBuilder(
      stream: bloc.topList,
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return TopListItem(snapshot, index);
            });
      },
    );
  }
}
