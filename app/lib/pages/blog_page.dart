import 'package:flutter/material.dart';

class blogPage extends StatelessWidget {
  const blogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text(
                "Blog",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            article_block_list(),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.post_add),
      ),
    );
  }
}

class article_block_list extends StatelessWidget {
  const article_block_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          ArticleBlock(),
          ArticleBlock(),
          ArticleBlock(),
          ArticleBlock(),
          ArticleBlock(),
          ArticleBlock(),
          ArticleBlock(),
        ]));
  }
}

class ArticleBlock extends StatelessWidget {
  const ArticleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
