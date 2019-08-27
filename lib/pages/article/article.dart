import 'package:flutter/material.dart';
import 'package:tb_mhd/pages/article/article_main.dart';

class Article extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pranikah = SizedBox(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/pranikah_article.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Artikel Pra Nikah',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        )
    );
    final pascanikah = SizedBox(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/pascanikah_article.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Artikel Pasca Nikah',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        )
    );
    final parenting = SizedBox(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/parenting_article.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Artikel Parenting',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        )
    );
    final buttonPra = ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.end,
        children: <Widget>[
//          FlatButton(
//            child: Text('SHARE'),
//            onPressed: () {},
//          ),
          FlatButton(
            child: Text('EXPLORE',
            style: TextStyle(fontSize: 14.0, color: Colors.blue)),
            //onPressed: () { new ListArticles(param: 'pra'); }
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListArticles(param: 'pra'),
                ),
              );
            }
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => MyApp()),
//                );
//              }
          ),
        ],
      ),
    );

    final buttonPasca = ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.end,
        children: <Widget>[
//          FlatButton(
//            child: Text('SHARE'),
//            onPressed: () {},
//          ),
          FlatButton(
            child: Text('EXPLORE',
                style: TextStyle(fontSize: 14.0, color: Colors.blue)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListArticles(param: 'pasca'),
                    ),
                  );
                }
          ),
        ],
      ),
    );

    final buttonParenting = ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.end,
        children: <Widget>[
//          FlatButton(
//            child: Text('SHARE'),
//            onPressed: () {},
//          ),
          FlatButton(
            child: Text('EXPLORE',
                style: TextStyle(fontSize: 14.0, color: Colors.blue)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListArticles(param: 'parenting'),
                    ),
                  );
                }
          ),
        ],
      ),
    );

    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              pranikah,
              buttonPra,
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              pascanikah,
              buttonPasca
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              parenting,
              buttonParenting
            ],
          ),
        ),
      ],
    );
  }
}
