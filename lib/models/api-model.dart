class CatsModel {
  String title;
  String picture;
  String content;
  String id;

  CatsModel(this.title, this.picture, this.content, this.id);

  factory CatsModel.fromJson(Map<String, dynamic> parsedJson) {
    return CatsModel(parsedJson['title'], parsedJson['picture'], parsedJson['content'], parsedJson['id']);
  }
}
