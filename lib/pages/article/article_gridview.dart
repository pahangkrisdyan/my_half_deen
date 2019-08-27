import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tb_mhd/models/article.dart';
import 'package:tb_mhd/pages/article/article_detail.dart';

class ArticleGridView extends StatelessWidget {
  final List<Articles> article;

  ArticleGridView({Key key, this.article}) : super(key: key);

  Card getStructuredGridCell(Articles article, BuildContext context) {
    print(article.title);
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Image.network(
              article.image,
              fit: BoxFit.cover,
              height: 140.0,
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 0.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
    //                  new Text(country.name),
    //                  new Text(country.nativeName),
    //                  new Text(country.capital),
                  new Text(article.title, softWrap: true,),
                  FlatButton.icon(
                    //child: Text('WATCH'),
                    label: Text('READ'),
                    icon: Icon(Icons.visibility),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleContent(title: article.title, image: article.image, content: article.content),
                          ),
                        );
                      }
                  ),
    //                    ButtonTheme.bar(
    //                      height: 5.0,
    //                      child: ButtonBar(
    //                        alignment: MainAxisAlignment.center,
    //                        children: <Widget>[
    //                //          FlatButton(
    //                //            child: Text('SHARE'),
    //                //            onPressed: () {},
    //                //          ),
    //                          FlatButton(
    //                            child: Text('WATCH'),
    //                            onPressed: () {},
    //                          ),
    //                        ],
    //                      ),
    //                    ),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(article.length, (index) {
        return getStructuredGridCell(article[index], context);
      }),
    );
  }
}
