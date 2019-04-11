import '../models/item_model.dart';

abstract class DataSource {
  Future<List<int>> getTopList();
  Future<ItemModel> getItem(int id);
}
