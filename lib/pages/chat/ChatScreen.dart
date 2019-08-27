import 'package:flutter/material.dart';
import 'ChatMessage.dart';
import 'package:tb_mhd/services/profile_netwoklayer.dart';
import 'package:tb_mhd/models/chat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  String uid;
  String idu;
  String nama;
  String image;

  ChatScreen({Key key, this.uid, this.idu, this.nama, this.image}) : super(key: key);

  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = new TextEditingController();
  final List<ChatMessage> _messages= <ChatMessage>[];
  List<Chat> _chat = List();

  var isLoading = false;

  ApiService _apiService = ApiService();

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("http://0.0.0.0:5000/chat/"+widget.uid+widget.idu);
    if (response.statusCode == 200) {
      _chat = (json.decode(response.body) as List)
          .map((data) => new Chat.fromJson(data))
          .toList();
      for (var chat in _chat) {
        ChatMessage chatMessage = new ChatMessage(chat: chat, id: widget.uid, image: widget.image, nama: widget.nama);
        _messages.insert(0, chatMessage);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _handleSubmit(String text) {
    textEditingController.clear();
    String id = 'id';
    String tanggal = 'tanggal';
    String node = widget.uid+widget.idu;
    String pengirim = widget.uid;
    String penerima = widget.idu;
    String konten = text;
    Chat chat =
    Chat(id: id, tanggal: tanggal, node: node, pengirim: pengirim, penerima: penerima, konten: konten);
    _apiService.createChat(chat);
    ChatMessage chatMessage = new ChatMessage(chat: chat, id: widget.uid, image: widget.image, nama: widget.nama);
    _messages.insert(0, chatMessage);
//    setState(() {
//          //used to rebuild our widget
//          _messages.insert(0, chatMessage);
//        });
  }

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Enter your message"),
                controller: textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text(widget.nama),
        ),
        body: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder:(_,int index)=>_messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(height: 1.0,),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _textComposerWidget(),
            )
          ],
        )
    );
  }
}
