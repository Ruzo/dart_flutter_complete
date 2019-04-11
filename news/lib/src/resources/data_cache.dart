import '../models/item_model.dart';

abstract class DataCache {
  Future<List<int>> getTopList();
  Future<ItemModel> getItem(int id);
  Future<int> insertItem(ItemModel item);
  Future<int> updateTopList(List<int> ids);
}
