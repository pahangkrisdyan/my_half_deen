import 'package:flutter/material.dart';
import 'package:tb_mhd/services/authentication.dart';
import 'package:tb_mhd/pages/home/home.dart';
import 'package:tb_mhd/pages/profile/profile.dart';
import 'package:tb_mhd/pages/article/article.dart';
import 'package:tb_mhd/pages/chat/ustadz_main.dart';
import 'package:tb_mhd/pages/video/video.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      new Home(id: widget.userId),
      new ListUstadz(id: widget.userId),
      new Article(),
      new Video(),
      new Profiles(id: widget.userId),
      // Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    ];
    final _kBottomNavbarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
      BottomNavigationBarItem(icon: Icon(Icons.library_books), title: Text('Article')),
      BottomNavigationBarItem(icon: Icon(Icons.video_library), title: Text('Video')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
    ];
    assert(_kTabPages.length == _kBottomNavbarItems.length);
    final bottomNavbar = BottomNavigationBar(
      items: _kBottomNavbarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    final drawerHeader = DrawerHeader(
      //child: Text('Drawer Header'),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'hero',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25.0,
              child: Image.asset('assets/logo.png'),
            ),
          ),
          Container (
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child : Text(
              'My Half Deen',
              style : TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
              'v 0.0.1'
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.pink[300],
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        Container (
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0),
          child : Text(
            'An application to provide education about marriage.',
            style : TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container (
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0),
          child : Text(
            'Developed by ResyncStudio.',
            style : TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About'),
          //onTap: () => Navigator.of(context).pushNamed(SelectorPage.tag),
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Rate on Google Play'),
          // trailing: Icon(Icons.arrow_forward),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.open_in_browser),
          title: Text('Visit my Website'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () { _signOut(); },
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text('My Half Deen'),
      ),
      body: _kTabPages[_currentTabIndex],
      drawer: Drawer(
        child: drawerItems,
      ),
      bottomNavigationBar: bottomNavbar,
    );
  }
}
