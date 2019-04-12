import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../models/item_model.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoriesBloc bloc = StoriesProvider.of(context);
    bloc.getTopNews(true);
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
              return Text('${snapshot.data[index]}');
            },
          );
        },
      ),
    );
  }
}
