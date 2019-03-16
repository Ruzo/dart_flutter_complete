class ImageModel {
  final int id;
  final String title;
  final String url;

  ImageModel(this.id, this.title, this.url);

  ImageModel.fromJson(Map<String, dynamic> image)
      : id = image['id'],
        title = image['title'],
        url = image['url'];
}
