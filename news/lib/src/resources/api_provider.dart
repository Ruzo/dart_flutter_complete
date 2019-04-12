import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'data_source.dart';
import '../models/item_model.dart';

class ApiProvider implements DataSource {
  var client = Client();
  final String _root = 'https://hacker-news.firebaseio.com/v0';

  Future<List<int>> getTopList() async {
    final response = await client.get('$_root/topstories.json');
    return jsonDecode(response.body).cast<int>();
  }

  Future<ItemModel> getItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    return ItemModel.fromJSON(jsonDecode(response.body));
  }
}
