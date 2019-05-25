import 'package:rxdart/rxdart.dart';
// import 'dart:collection';
import '../resources/repository.dart';
import '../models/item_model.dart';

class StoriesBloc {
  final Repository _repository = Repository();
  List<int> _ids;

  final PublishSubject<List<int>> _topList = PublishSubject<List<int>>();

  StoriesBloc() {
    getTopNews();
  }

  Observable<List<int>> get topList => _topList.stream;

  Future<ItemModel> fetchItem(int row) async {
    return await getNewsItem(_ids[row]);
  }

  void getTopNews() async {
    _ids = await _repository.fetchTopNews();
    _topList.add(_ids);
  }

  Future<ItemModel> getNewsItem(int id) async {
    final item = await _repository.fetchItem(id);
    // print('Got item');
    return item;
  }

  resfreshTopList() async {
    await _repository.refreshTopList();
    return getTopNews();
  }

  void dispose() {
    _topList.close();
  }
}
