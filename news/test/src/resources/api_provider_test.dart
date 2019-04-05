import 'package:news/src/resources/api_provider.dart';
import 'package:news/src/models/item_model.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

main() {
  group('Api Provider', () {
    test('getTopList expected to return a list of ids', () async {
      final mockedApi = ApiProvider();

      final data = [19582056, 19581721, 19581788, 19581670, 19582017];

      mockedApi.client = MockClient((request) async {
        return Response(jsonEncode(data), 200);
      });

      final ids = await mockedApi.getTopList();

      expect(ids, data);
    });

    test('getItem expected to return an ItemModel', () async {
      final mockedApi = ApiProvider();

      final data = jsonEncode({
        "by": "dhouston",
        "descendants": 71,
        "id": 8863,
        "kids": [
          9224,
          8917,
          8952,
          8884,
          8887,
        ],
        "score": 104,
        "time": 1175714200,
        "title": "My YC app: Dropbox - Throw away your USB drive",
        "type": "story",
        "url": "http://www.getdropbox.com/u/2/screencast.html"
      });

      ItemModel mockedItem = ItemModel.fromJSON(jsonDecode(data));

      mockedApi.client = MockClient((request) async {
        return Response(data, 200);
      });

      ItemModel item = await mockedApi.getItem(8863);

      expect(item.id, mockedItem.id);
    });
  });
}
