import 'package:ecology/pages/article.dart';
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
                  return Container();
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
                  .map((article) => ArticleItem(
                        id: article.id,
                        title: article.title,
                        text: article.text,
                      ))
                  .toList()));
    });
  }
}

class ArticleItem extends StatelessWidget {
  const ArticleItem(
      {required this.id, required this.title, required this.text, Key? key})
      : super(key: key);

  final int id;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Article(id: id)));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                    ),
                  )),
              Text(
                '$text...',
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ));
  }
}
