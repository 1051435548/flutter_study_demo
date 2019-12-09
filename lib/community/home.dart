import 'package:Flutter/community/bottomNavigationBar/four.dart';
import 'package:Flutter/community/bottomNavigationBar/one.dart';
import 'package:Flutter/community/bottomNavigationBar/three.dart';
import 'package:Flutter/community/bottomNavigationBar/two.dart';
import 'package:Flutter/community/drawer.dart';
import 'package:Flutter/utils/DoubleExit.dart';
import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

/// 封装一个bottomNavigation
class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(title),
            backgroundColor: color),
        controller = AnimationController(
            duration: kThemeAnimationDuration, vsync: vsync) {
    _animation = controller.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final Widget _icon;
  final String _title;
  final Color _color;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  Animation<double> _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(
            begin: const Offset(0.0, 0.02),
            end: Offset.zero,
          ),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: _color,
            size: 120.0,
          ),
          child: Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        icon: const Icon(Icons.home),
        title: '首页1',
        color: Colors.green,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.star),
        icon: const Icon(Icons.star_border),
        title: '首页2',
        color: Colors.grey,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.cloud),
        icon: const Icon(Icons.cloud_queue),
        title: '首页3',
        color: Colors.teal,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: const Icon(Icons.favorite),
        icon: const Icon(Icons.favorite_border),
        title: '首页4',
        color: Colors.cyan,
        vsync: this,
      ),
    ];

    _navigationViews[_selectedIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  var _pageController = PageController(initialPage: 0);

  /// 底部对应的组件
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
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationIconView) =>
                  navigationIconView.item)
          .toList(),
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        _clickPageChange(index);
      },
    );
    return WillPopScope(
      onWillPop: () => DoubleExit.doubleClickBack(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(icon),
              tooltip: _tooltip(),
              onPressed: () {
                _iconClick(context);
              },
            ),
          ],
        ),
        drawer: ShowDrawer(),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            One(),
            Two(),
            Three(),
            Four(),
          ],
        ),
//        /// 如果底部要滑动效果可以用下面的body代码，但是不可以记录滑动状态了
//        body: _body(),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget _body() {
    /// 滑动效果
    return PageView.builder(
      onPageChanged: _slidePageChange,
      controller: _pageController,
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return pages.elementAt(_selectedIndex);
      },
    );
  }

  /// 点击页面右上角的icon
  void _iconClick(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        ToastUtil.show(context: context, msg: '准备跳转到首页1');
        break;
      case 1:
        ToastUtil.show(context: context, msg: '准备跳转到首页2');
        break;
      case 2:
        ToastUtil.show(context: context, msg: '准备跳转到首页3');
        break;
      case 3:
        ToastUtil.show(context: context, msg: '准备跳转到首页4');
        break;
    }
  }

  /// 长按页面右上角的icon
  String _tooltip() {
    String tooltip;
    switch (_selectedIndex) {
      case 0:
        tooltip = '首页1';
        break;
      case 1:
        tooltip = '首页2';
        break;
      case 2:
        tooltip = '首页3';
        break;
      case 3:
        tooltip = '首页4';
        break;
    }
    return tooltip;
  }

  /// 通过滑动来改变底部页面
  void _slidePageChange(int index) {
    _pageChange(index);
  }

  /// 通过点击来改变底部页面
  void _clickPageChange(int index) {
    setState(() {
      _navigationViews[_selectedIndex].controller.reverse();
      _pageChange(index);
      _navigationViews[_selectedIndex].controller.forward();
    });
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
}
