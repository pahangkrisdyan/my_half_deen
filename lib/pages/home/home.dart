import 'package:flutter/material.dart';
import 'package:tb_mhd/pages/profile/profile.dart';
import 'package:tb_mhd/pages/article/article_main.dart';
import 'package:tb_mhd/pages/video/video_main.dart';
import 'package:tb_mhd/pages/chat/ustadz_main.dart';

class Home extends StatelessWidget {

  String id;

  Home({Key key, this.id}) : super(key: key);

  final List<String> assetNames = [
    'assets/pranikah_article.jpg',
    'assets/pascanikah_article.jpg',
    'assets/parenting_article.jpg',
    'assets/pranikah_video.jpg',
    'assets/pascanikah_video.jpg',
    'assets/parenting_video.jpg',
    //'assets/logo.png',
  ];

  final List<String> ustadzNames = [
    'Artikel Pra Nikah',
    'Artikel Pasca Nikah',
    'Artikel Parenting',
    'Video Pra Nikah',
    'Video Pasca Nikah',
    'Video Parenting',
    //'assets/logo.png',
  ];

  final link = <Widget>[
    ListArticles(param: 'pra'),
    ListArticles(param: 'pasca'),
    ListArticles(param: 'parenting'),
    ListVideos(param: 'pra'),
    ListVideos(param: 'pasca'),
    ListVideos(param: 'parenting'),
  ];

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        child: _buildContent(),
//      ),
//    );
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset('assets/sliver_image.jpg'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Hello Daud Muhajir',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Baru gabung dengan My Half Deen? Kami selalu ada untuk membantu Anda',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              alignment: Alignment.center,
              height: 60.0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListUstadz(id: id),
                      ),
                    );
                  },
                  child: Text("Chat dengan Ustadz/ah",
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.white))
              ),
              decoration: new BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: new BorderRadius.circular(9.0)),
          ),
          Divider(),
          ListTile(
            //leading: Icon(Icons.info_outline),
            title: Text(
              'Artikel dan Video',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            onTap: () {},
          ),
          _buildHorizontalList(parentIndex: 0, context: context),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext content, int index) {
          return _buildHorizontalList(parentIndex: index);
        });
  }

  Widget _buildHorizontalList({int parentIndex, BuildContext context}) {
    var colors = [
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.red,
      Colors.orange
    ];
    double height = 250.0;
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext content, int index) {
            return _buildCard(
              index: index,
              color: colors[(parentIndex + index) % colors.length],
              parentSize: 180,
              context: context
            );
          }),
    );
  }

  Widget _buildCard({int index, Color color, double parentSize, BuildContext context}) {
    double edgeSize = 8.0;
    double itemSize = parentSize - edgeSize * 2.0;
    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
              width: itemSize,
              height: itemSize,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      assetNames[index % assetNames.length],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
          ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: new Text(ustadzNames[index % ustadzNames.length]),
          ),
          FlatButton.icon(
            //child: Text('WATCH'),
            label: Text('EXPLORE'),
            icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => link[index % link.length],
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

  Widget _buildItem({int index, Color color, double parentSize}) {
    double edgeSize = 8.0;
    double itemSize = parentSize - edgeSize * 2.0;
    return Container(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: Container(
          alignment: AlignmentDirectional.center,
          color: color,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
