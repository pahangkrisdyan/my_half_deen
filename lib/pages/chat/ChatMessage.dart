import 'package:flutter/material.dart';
import 'package:tb_mhd/models/chat.dart';

const String _name = "Daud Muhajir";

class ChatMessage extends StatelessWidget {
  Chat chat;
  String id;
  String image;
  String nama;

  var isPengirim = true;
  //for opotional params we use curly braces
  ChatMessage({this.chat, this.id, this.image, this.nama});

  @override
  Widget build(BuildContext context) {
    if (chat.pengirim == id){
      isPengirim = false;
    }
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: isPengirim
              ? new Image.network(image,
                fit: BoxFit.cover,)
              : new Text(chat.pengirim[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                  isPengirim
                  ? nama
                  : chat.pengirim,
                  style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(chat.konten),
              )
            ],
          )
        ],
      ),
    );
  }
}
