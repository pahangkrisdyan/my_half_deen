import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_mhd/models/article.dart';
import 'package:tb_mhd/services/article_netwoklayer.dart';
import 'package:tb_mhd/pages/article/article_gridview.dart';
import 'package:http/http.dart' as http;


class ListArticles extends StatelessWidget {
  String param;
  String category;

  ListArticles({Key key, this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(param == 'pra'){
      category = 'Artikel Pra Nikah';
    } else if (param == 'pasca'){
      category = 'Artikel Pasca Nikah';
    } else if(param == 'parenting'){
      category = 'Artikel Parenting';
    };

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(category,
          style: new TextStyle(
            color: const Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: new FutureBuilder<List<Articles>>(
        future: fetchArticle(new http.Client(), param),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print(snapshot.hasData);
          print(snapshot.data);
          print('tes'+ param);
          return snapshot.hasData
              ? new ArticleGridView(article: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
