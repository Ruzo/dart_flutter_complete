import 'api_provider.dart';
import 'db_provider.dart';
import 'data_source.dart';
import 'data_cache.dart';
import '../models/item_model.dart';

class Repository {
  ApiProvider api = ApiProvider();
  DbProvider db = DbProvider();
  List<DataSource> sources = [ApiProvider()];
  List<DataCache> caches = [DbProvider()];

  Future<List<int>> fetchTopNews(bool refresh) async {
    List<int> list;
    if (!refresh) {
      for (var cache in caches) {
        list = await cache.getTopList();
        if (list != null) return list;
      }
    }

    for (var source in sources) {
      list = await source.getTopList();
      if (list != null) return list;
    }

    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    for (var cache in caches) {
      item = await cache.getItem(id);
      if (item != null) return item;
    }

    for (var source in sources) {
      item = await source.getItem(id);
      if (item != null) break;
    }

    if (item != null) {
      for (var cache in caches) {
        cache.insertItem(item);
      }
    }

    return item;
  }
}
