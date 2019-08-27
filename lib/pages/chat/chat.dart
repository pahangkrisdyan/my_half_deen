import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'ChatApp.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.minExtent,
    this.maxExtent,
  });
  double maxExtent;
  double minExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/sliver_image.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
//        Positioned(
//          left: 4.0,
//          top: 4.0,
//          child: SafeArea(
//            child: IconButton(
//              icon: Icon(Icons.home),
//              onPressed: () {},
//            ),
//          ),
//        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Chatting',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class Chat extends StatelessWidget {

  final List<String> assetNames = [
    'assets/avatar/ustadzah1.jpg',
    'assets/avatar/ustadz1.png',
    'assets/avatar/ustadzah2.jpg',
    'assets/avatar/ustadz2.png',
    'assets/avatar/ustadzah3.jpg',
    'assets/avatar/ustadz3.png',
    'assets/avatar/ustadzah4.jpg',
    //'assets/logo.png',
  ];

  final List<String> ustadzNames = [
    'Ustadz/ah 1',
    'Ustadz 1',
    'Ustadz/ah 2',
    'Ustadz 2',
    'Ustadz/ah 3',
    'Ustadz 3',
    'Ustadz/ah 4',
    //'assets/logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
//          SliverAppBar(
//            pinned: true,
//            expandedHeight: 160.0,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text("Chatting"),
//              background: Image.asset(
//                'assets/logo.png',
//                fit: BoxFit.fill,
//              ),
//            ),
//          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 168.0,
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
                        label: Text('CHAT'),
                        icon: Icon(Icons.chat),
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ChatApp()),
//                          );
//                        },
                      ),
                    ],
                  ),
                );
              },
              childCount: assetNames.length,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }
}
