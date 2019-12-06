import 'package:Flutter/community/bottomNavigationBar/four.dart';
import 'package:Flutter/community/bottomNavigationBar/one.dart';
import 'package:Flutter/community/bottomNavigationBar/three.dart';
import 'package:Flutter/community/bottomNavigationBar/two.dart';
import 'package:Flutter/community/drawer.dart';
import 'package:Flutter/utils/DoubleExit.dart';
import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  static const String routeName = '/register';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  var _pageController = PageController(initialPage: 0);

  var pages = <Widget>[
    One(),
    Two(),
    Three(),
    Four(),
  ];

  String title = '开门1';
  var titles = [
    '开门1',
    '开门2',
    '开门3',
    '开门4',
  ];

  var icon = Icons.search;
  var icons = [Icons.search, Icons.star, Icons.share, Icons.near_me];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => DoubleExit.doubleClickBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(icon),
              tooltip: '搜索',
              onPressed: () {
                _iconClick(context);
              },
            ),
          ],
        ),
        drawer: ShowDrawer(),
        body: _body(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _body() {
    return PageView.builder(
      onPageChanged: _pageChange,
      controller: _pageController,
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return pages.elementAt(_selectedIndex);
      },
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('首页1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_list),
          title: Text('首页2'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.low_priority),
          title: Text('首页3'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          title: Text('首页4'),
        ),
      ],
      currentIndex: _selectedIndex,
      //显示模式
      type: BottomNavigationBarType.fixed,
      //选中颜色
      fixedColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
      //根据下标修改标题
      switch (index) {
        case 0:
          title = titles[index];
          icon = icons[index];
          break;
        case 1:
          title = titles[index];
          icon = icons[index];
          break;
        case 2:
          title = titles[index];
          icon = icons[index];
          break;
        case 3:
          title = titles[index];
          icon = icons[index];
          break;
      }
    });
  }

  void _iconClick(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        ToastUtil.show(context: context, msg: '准备跳转到搜索页面');
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
}
