import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tb_mhd/models/ustadz.dart';
import 'package:tb_mhd/pages/chat/ChatScreen.dart';

class UstadzGridView extends StatelessWidget {
  final List<Ustadz> ustadz;
  String uid;

  UstadzGridView({Key key, this.ustadz, this.uid}) : super(key: key);

  Card getStructuredGridCell(Ustadz ustadz, BuildContext context) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Image.network(
              ustadz.image,
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
                  new Text(ustadz.nama),
                  FlatButton.icon(
                    //child: Text('WATCH'),
                    label: Text('CHAT'),
                    icon: Icon(Icons.chat),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(uid: uid, idu: ustadz.id, nama: ustadz.nama, image:ustadz.image),
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
      children: List.generate(ustadz.length, (index) {
        return getStructuredGridCell(ustadz[index], context);
      }),
    );
  }
}
