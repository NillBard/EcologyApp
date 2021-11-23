import 'package:flutter/material.dart';

class blogPage extends StatelessWidget {
  const blogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text("Blog",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 30.0,
                  ),
                ),
            ),
            ArticleBlock(),
            ArticleBlock(),
          ],
        ),
      ),
     
    );
  }
}

class ArticleBlock extends StatelessWidget {
  const ArticleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(horizontal: 10),    
      height: 130,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Article', 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20.0,
                  ),
              ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eleifend quam adipiscing tortor vitae cursus non tellus...",
              overflow: TextOverflow.fade
              )
        ],
      ),
    );
  }
}
