import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import '../models/item_model.dart';

class StoriesBloc {
  final Repository _repository = Repository();

  final PublishSubject<List<int>> _topList = PublishSubject<List<int>>();

  Observable<List<int>> get topList => _topList.stream;

  void getTopNews(bool refresh) async {
    final List<int> ids = await _repository.fetchTopNews(refresh);
    _topList.sink.add(ids);
  }

  Future<ItemModel> getNewsItem(int id) async {
    return await _repository.fetchItem(id);
  }

  void dispose() {
    _topList.close();
  }
}
