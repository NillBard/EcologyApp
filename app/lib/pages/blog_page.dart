import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Text(
                "Blog",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            const ArticleBlockList(),
          ],
        ),
      ),
    );
  }
}

class ArticleBlockList extends StatelessWidget {
  const ArticleBlockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          ArticleBlock(),
          ArticleBlock(),
        ]);
  }
}

class ArticleBlock extends StatelessWidget {
  const ArticleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
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
        children: const [
          Text(
            'Article',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eleifend quam adipiscing tortor vitae cursus non tellus...",
              overflow: TextOverflow.fade)
        ],
      ),
    );
  }
}
