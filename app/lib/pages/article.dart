import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ecology/providers/article.dart';

class Article extends StatefulWidget {
  const Article({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  late Future<void> _articleFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _articleFuture = Provider.of<ArticleState>(context).fetchArticle(widget.id);
  }

  @override
  Widget build(context) {
    return FutureBuilder(
        future: _articleFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            return Consumer<ArticleState>(builder: (context, articleState, _) {
              if (articleState.article != null) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    centerTitle: false,
                    title: const Text(
                      'Blog',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.all(24),
                        child: Text(articleState.article!.text,
                            style: const TextStyle(fontSize: 24))),
                  ),
                );
              } else {
                return Container();
              }
            });
          }
        });
  }
}
