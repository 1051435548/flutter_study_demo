import 'package:Flutter/community/login.dart';
import 'package:Flutter/demo/scrollZoomView.dart';
import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Page {
  const _Page({
    this.icon,
    this.text,
  });

  final IconData icon;
  final String text;
}

const List<_Page> _allPages = <_Page>[
  _Page(icon: Icons.grade, text: '家具'),
  _Page(icon: Icons.playlist_add, text: '电器'),
  _Page(icon: Icons.check_circle, text: '玩具'),
  _Page(icon: Icons.question_answer, text: '电子产品'),
  _Page(icon: Icons.gps_not_fixed, text: '宠物'),
  _Page(icon: Icons.camera, text: '书籍'),
  _Page(icon: Icons.cloud, text: '帽子'),
  _Page(icon: Icons.g_translate, text: '耳机'),
];

class YScrollZoomView2 extends StatefulWidget {
  @override
  _YScrollZoomView2State createState() => _YScrollZoomView2State();
}

class _YScrollZoomView2State extends State<YScrollZoomView2>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _tabController = TabController(length: _allPages.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CustomScrollView(
          controller: _controller,

          /// 物理滚动  可以自定义
//          physics: ScrollPhysics(),
          slivers: <Widget>[
            _sliverAppBar(),
            SliverToBoxAdapter(
              child: Card(
                elevation: 20.0,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Container(
                  color: Colors.cyan,
                  width: 200,
                  height: 150,
                  alignment: Alignment.center,
                  child: Text(
                    "Card",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ScrollZoomView();
                    }));
                  },
                  child: Text('点我'),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _One(),
                  _Two(),
                  _Three(),
                  _Four(),
                  _Five(),
                  _Six(),
                  _Seven(),
                  _Eight(),
                ],
              ),
            ),
          ],
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        icon: Image.asset('images/twitter.png'),
        onPressed: () {},
      ),
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 150.0,
      forceElevated: true,
      title: Text('数据展示'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        labelColor: Colors.black,
        isScrollable: true,
        controller: this._tabController,
        tabs: _allPages.map<Tab>((_Page _page) {
          return Tab(
            text: _page.text,
            icon: Icon(_page.icon),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1500));
    ToastUtil.show(context: context, msg: '页面被刷新了');
    return new Future(() => null);
  }
}

class _One extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/lake.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是2'),
    );
  }
}

class _Three extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是3'),
    );
  }
}

class _Four extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是4'),
    );
  }
}

class _Five extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是5'),
    );
  }
}

class _Six extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是6'),
    );
  }
}

class _Seven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是7'),
    );
  }
}

class _Eight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是8'),
    );
  }
}
