import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJSON(Map<String, dynamic> parsedJSON)
      : id = parsedJSON['id'],
        deleted = parsedJSON['deleted'] ?? false,
        type = parsedJSON['type'] ?? '',
        by = parsedJSON['by'] ?? '',
        time = parsedJSON['time'] ?? 0,
        text = parsedJSON['text'] ?? '',
        dead = parsedJSON['dead'] ?? false,
        parent = parsedJSON['parent'] ?? 0,
        kids = parsedJSON['kids'] ?? [],
        url = parsedJSON['url'] ?? '',
        score = parsedJSON['score'] ?? 0,
        title = parsedJSON['title'] ?? '',
        descendants = parsedJSON['descendants'] ?? 0;

  ItemModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        deleted = map['deleted'] == 1 ? true : false,
        type = map['type'],
        by = map['by'],
        time = map['time'],
        text = map['text'],
        dead = map['dead'] == 1 ? true : false,
        parent = map['parent'],
        kids = jsonDecode(map['kids']),
        url = map['url'],
        score = map['score'],
        title = map['title'],
        descendants = map['descendants'];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "deleted": deleted ? 1 : 0,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "dead": dead ? 1 : 0,
      "parent": parent,
      "kids": jsonEncode(kids),
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants
    };
  }
}

//TODO: Create fromDb and toDB constructors
