import 'package:flutter/material.dart';
import 'package:spajam/ui/page/home_page.dart';
import 'package:spajam/ui/page/member_list/member_list_page.dart';
import 'package:spajam/ui/page/mission_page.dart';

class BottomTabPage extends StatefulWidget {
  BottomTabPage({Key key, this.projectId}) : super(key: key);
  final int projectId;

  @override
  _BottomTabPageState createState() => new _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  PageController _pageController;
  var _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('{プロジェクトタイトル}'),
      ),
      body: PageView(
        children: <Widget>[
          HomePage(),
          MemerListPage(
              image:
                  'https://mosaic02.ztat.net/vgs/media/pdp-zoom/LE/22/1D/02/2A/12/LE221D022-A12@16.1.jpg'),
          MissionPage(),
          // Container(
          //   color: Colors.orangeAccent,
          // ),
          // Container(
          //   color: Colors.redAccent,
          // ),
          // Container(
          //   color: Colors.blueAccent,
          // ),
        ],
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Member"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Mission"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  ///
  /// Bottom Navigation tap listener
  ///
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
