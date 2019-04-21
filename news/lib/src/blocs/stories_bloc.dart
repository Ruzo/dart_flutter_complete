import 'package:rxdart/rxdart.dart';
import 'dart:collection';
import '../resources/repository.dart';
import '../models/item_model.dart';

class StoriesBloc {
  StoriesBloc() {
    getTopNews();
  }

  final Repository _repository = Repository();

  final PublishSubject<UnmodifiableListView<ItemModel>> _itemsList =
      PublishSubject<UnmodifiableListView<ItemModel>>();

  Observable<UnmodifiableListView<ItemModel>> get itemsList =>
      _itemsList.stream;

  void getTopNews() async {
    final List<int> ids = await _repository.fetchTopNews();
    Future<List<ItemModel>> newsItems =
        Future.wait(ids.map((id) => getNewsItem(id)).toList());
    _itemsList.add(UnmodifiableListView(await newsItems));
  }

  Future<ItemModel> getNewsItem(int id) async {
    final item = await _repository.fetchItem(id);
    // print('Got item');
    return item;
  }

  resfreshTopList() async {
    return await _repository.refreshTopList();
  }

  void dispose() {
    _itemsList.close();
  }
}
