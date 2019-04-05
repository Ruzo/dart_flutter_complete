import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class ApiProvider {
  var client = Client();
  final String root = 'https://hacker-news.firebaseio.com/v0';

  getTopList() async {
    final response = await client.get('/topstories.json');
    return jsonDecode(response.body);
  }

  getItem(int id) async {
    final response = await client.get('/item/$id.json');
    return ItemModel.fromJSON(jsonDecode(response.body));
  }
}
