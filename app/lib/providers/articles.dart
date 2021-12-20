import 'package:ecology/helpers/http.dart';
import 'package:ecology/models/article.dart';

import 'base.dart';

class ArticlesState extends BaseProvider {
  ArticlesState({required this.http});

  Http http;
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    _articles = await http.get('/articles', Article.fromJsonList);
  }
}
