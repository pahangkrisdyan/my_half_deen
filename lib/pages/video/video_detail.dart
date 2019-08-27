import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class VideoContent extends StatelessWidget {
  String title;
  String image;
  String url;

  VideoContent({Key key, this.title, this.image, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final _image = SizedBox(
        height: 180.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
    );

    final _title = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28.0, color: Colors.black),
      ),
    );

    final _content = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        url+'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );

    final _video = YoutubePlayer(
      context: context,
      source: url,
      quality: YoutubeQuality.HD,
    );

    final body = ListView(
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0.0),
      children: <Widget>[_image, _title, _video],
//      decoration: BoxDecoration(
//        gradient: LinearGradient(colors: [
//          Colors.blue,
//          Colors.lightBlueAccent,
//        ]),
//      ),
//      child: Column(
//        children: <Widget>[pranikah, welcome, lorem],
//      ),
    );

    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
