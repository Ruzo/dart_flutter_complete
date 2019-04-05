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
        deleted = parsedJSON['deleted'],
        type = parsedJSON['type'],
        by = parsedJSON['by'],
        time = parsedJSON['time'],
        text = parsedJSON['text'],
        dead = parsedJSON['dead'],
        parent = parsedJSON['parent'],
        kids = parsedJSON['kids'],
        url = parsedJSON['url'],
        score = parsedJSON['score'],
        title = parsedJSON['title'],
        descendants = parsedJSON['descendants'];
}
