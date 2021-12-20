class Article {
  Article(
      {required this.id,
      required this.title,
      required this.text,
      required this.createdAt});

  int id;
  String title;
  String text;
  String createdAt;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'],
        title: json['title'],
        text: json['text'],
        createdAt: json['createdAt']);
  }

  static List<Article> fromJsonList(Iterable<dynamic> json) {
    return List<Article>.from(json.map((item) => Article(
        id: item['id'],
        title: item['title'],
        text: item['text'],
        createdAt: item['createdAt'])));
  }
}
