import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_mhd/models/ustadz.dart';
import 'package:tb_mhd/services/ustadz_netwoklayer.dart';
import 'package:tb_mhd/pages/chat/ustadz_gridview.dart';
import 'package:http/http.dart' as http;

class ListUstadz extends StatelessWidget {
  String id;

  ListUstadz({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Chatting',
//        style: new TextStyle(
//          color: const Color(0xFFFFFFFF),
//        ),
//        ),
//      ),
      body: new FutureBuilder<List<Ustadz>>(
        future: fetchUstadz(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new UstadzGridView(ustadz: snapshot.data, uid: id)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
