import 'package:flutter/material.dart';
import 'package:tb_mhd/pages/video/video_main.dart';

class Video extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pranikah = SizedBox(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/pranikah_video.jpg',
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
                  'Video Pra Nikah',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black),
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
                'assets/pascanikah_video.jpg',
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
                  'Video Pasca Nikah',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black),
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
                'assets/parenting_video.jpg',
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
                  'Video Parenting',
                  style: Theme.of(context).textTheme.headline.copyWith(color: Colors.black),
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
                    builder: (context) => ListVideos(param: 'pra'),
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
                    builder: (context) => ListVideos(param: 'pasca'),
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
                    builder: (context) => ListVideos(param: 'parenting'),
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
