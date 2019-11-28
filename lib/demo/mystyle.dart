import 'package:Flutter/demo/mystyle2.dart';
import 'package:flutter/material.dart';

class MyStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'show',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _Home());
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("it's me"),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: null,
          tooltip: '你要离开么',
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.local_bar,
              color: Colors.white,
            ),
            onPressed: null,
            tooltip: '要来一杯吗',
          ),
          new IconButton(
            icon: new Icon(
              Icons.local_florist,
              color: Colors.white,
            ),
            onPressed: null,
            tooltip: '幸福像花儿一样',
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Image.asset(
                'images/lake.jpg',
                width: MediaQuery.of(context).size.width, //屏幕最大宽度
                height: 240.0,
                fit: BoxFit.cover,
              ),
              //文字行带图标
              _ColumnOne(),
              //三个按钮
              _ColumnTwo(),
              //文本行
              _ColumnThree(),
              //按钮行，与上面不同的是这里是方法而不是类
              new Container(
                child: new RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    _submit(context);
                  },
                  child: new Text(
                    'Click Me',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyStyle2();
    }));
  }
}

// ignore: slash_for_doc_comments
/**
 * 文字行带图标
 */
class _ColumnOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Blue Oeschinen Lake Campground',
                  style: new TextStyle(color: Colors.blue),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
              ),
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * 三个按钮
 */
class _ColumnTwo extends MyStyle {
  Column _iconItem(IconData icon, String label) {
    return new Column(
      children: <Widget>[
        new Icon(
          icon,
          color: Colors.blue,
        ),
        new Container(
          padding: EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style:
                new TextStyle(fontWeight: FontWeight.w400, color: Colors.blue),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _iconItem(Icons.phone, 'CALL'),
          _iconItem(Icons.near_me, 'ROUTE'),
          _iconItem(Icons.share, 'SHARE'),
        ],
      ),
    );
  }
}

//
// ignore: slash_for_doc_comments
/**
 * 文本行
 */
class _ColumnThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}
