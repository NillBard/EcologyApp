import 'package:ecology/helpers/http.dart';
import 'package:ecology/models/article.dart';

import 'base.dart';

class ArticleState extends BaseProvider {
  ArticleState({required this.http});

  Http http;
  Article? _article;

  Article? get article => _article;

  Future<void> fetchArticle(int id) async {
    _article = await http.get('/articles/$id', Article.fromJson);
  }
}
