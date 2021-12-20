import 'package:ecology/providers/articles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  late Future<void> _articleFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _articleFuture = Provider.of<ArticlesState>(context).fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Blog'),
          centerTitle: false,
          elevation: 0,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _articleFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return const ArticleBlockList();
                }
              }),
        ));
  }
}

class ArticleBlockList extends StatelessWidget {
  const ArticleBlockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesState>(builder: (context, articlesState, _) {
      return Container(
          margin: const EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: articlesState.articles
                  .map((article) => Article(
                        title: article.title,
                        text: article.text,
                      ))
                  .toList()));
    });
  }
}

class Article extends StatelessWidget {
  const Article({required this.title, required this.text, Key? key})
      : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text('$text...', overflow: TextOverflow.fade)
        ],
      ),
    );
  }
}
