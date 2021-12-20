class Article {
  Article({required this.title, required this.text, required this.createdAt});

  String title;
  String text;
  String createdAt;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'], text: json['text'], createdAt: json['createdAt']);
  }

  static List<Article> fromJsonList(Iterable<dynamic> json) {
    return List<Article>.from(json.map((item) => Article(
        title: item['title'],
        text: item['text'],
        createdAt: item['createdAt'])));
  }
}
