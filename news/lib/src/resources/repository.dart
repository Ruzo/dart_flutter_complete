import 'api_provider.dart';
import 'db_provider.dart';
import 'data_source.dart';
import 'data_cache.dart';
import '../models/item_model.dart';

class Repository {
  List<DataSource> sources = [ApiProvider()];
  List<DataCache> caches = [DbProvider()];

  Future<List<int>> fetchTopNews(bool refresh) async {
    List<int> list;
    if (!refresh) {
      for (DataCache cache in caches) {
        list = await cache.getTopList();
        if (list != null) return list;
      }
    }

    for (DataSource source in sources) {
      list = await source.getTopList();
      if (list != null) {
        for (DataCache cache in caches) {
          await cache.updateTopList(list);
        }
        return list;
      }
    }

    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    print('in Repository with id $id');
    ItemModel item;
    for (DataCache cache in caches) {
      item = await cache.getItem(id);
      if (item != null) {
        print('$id in cache');
        return item;
      }
      print('$id not in cache');
    }

    for (DataSource source in sources) {
      item = await source.getItem(id);
      if (item != null) {
        for (DataCache cache in caches) {
          await cache.insertItem(item);
          print('Cached item $id');
        }
        return item;
      }
      print('$id null from source');
    }

    return null;
  }
}
