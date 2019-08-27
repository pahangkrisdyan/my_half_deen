import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_mhd/models/video.dart';
import 'package:tb_mhd/services/video_netwoklayer.dart';
import 'package:tb_mhd/pages/video/video_gridview.dart';
import 'package:http/http.dart' as http;

class ListVideos extends StatelessWidget {
  String param;
  String category;

  ListVideos({Key key, this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(param == 'pra'){
      category = 'Video Pra Nikah';
    } else if (param == 'pasca'){
      category = 'Video Pasca Nikah';
    } else if(param == 'parenting'){
      category = 'Video Parenting';
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
      body: new FutureBuilder<List<Videos>>(
        future: fetchVideo(new http.Client(), param),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print(snapshot.hasData);
          print('tes'+param);
          return snapshot.hasData
              ? new VideoGridView(video: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
