import 'package:flutter/material.dart';

class YScrollZoomView1 extends StatefulWidget {
  @override
  _YScrollZoomView1State createState() => _YScrollZoomView1State();
}

class _YScrollZoomView1State extends State<YScrollZoomView1>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            _sliverAppBar(),

            /// 类似 sliverAppBar，delegate可以实现其他各种组件
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this.tabController,
                  tabs: <Widget>[
                    Tab(text: 'Home'),
                    Tab(text: 'Profile'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
            ),

            /// 当一个item大于一个屏幕时用这个
            SliverFillViewport(

                /// 与屏幕的比例 1.0 为整个屏幕
                viewportFraction: 1.0,
                delegate: SliverChildBuilderDelegate(
                    (_, index) => Container(
                          child: Text('Item $index'),
                          alignment: Alignment.center,
                        ),
                    childCount: 2)),

            /// 把其他组件放进该组件的child以此可在CustomScrollView中展示
            SliverToBoxAdapter(
              child: Container(
                height: 30.0,
                color: Colors.blue,
              ),
            ),

            /// 用于最后填充，会填补剩余的地方
            SliverFillRemaining(
              child: TabBarView(
                controller: this.tabController,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'images/lake.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(child: Text('Content of Profile')),
                  Center(child: Text('Content of Profile')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget _sliverAppBar() {
    return SliverAppBar(
      title: Text('小title'),
      centerTitle: true,
      expandedHeight: 300.0,
      forceElevated: true,
      pinned: true,
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.done),
          onPressed: () {},
        ),
      ],

      /// 设置AppBar的背景
      flexibleSpace: FlexibleSpaceBar(
//        title: Text('缩放吸顶'),
        centerTitle: true,

        /// 折叠动画
        collapseMode: CollapseMode.parallax,

        /// 背景用stack给图片添加颜色阴影
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned.fill(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/lake.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black87, Colors.transparent],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
