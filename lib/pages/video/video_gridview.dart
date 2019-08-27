import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tb_mhd/models/video.dart';
import 'package:tb_mhd/pages/video/video_detail.dart';

class VideoGridView extends StatelessWidget {
  final List<Videos> video;

  VideoGridView({Key key, this.video}) : super(key: key);

  Card getStructuredGridCell(Videos video, BuildContext context) {
    print(video.title);
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Image.network(
              video.image,
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
                  new Text(video.title),
                  FlatButton.icon(
                    //child: Text('WATCH'),
                    label: Text('WATCH'),
                    icon: Icon(Icons.visibility),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VideoContent(title: video.title, image: video.image, url: video.url),
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
      children: List.generate(video.length, (index) {
        return getStructuredGridCell(video[index], context);
      }),
    );
  }
}
