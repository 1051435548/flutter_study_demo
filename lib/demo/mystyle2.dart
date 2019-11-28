import 'package:flutter/material.dart';

class MyStyle2 extends StatelessWidget {
  final BorderSide _columnBorderSide =
      BorderSide(color: Colors.black, width: 1);

  final _textColor = Colors.teal[600];

  @override
  Widget build(BuildContext context) {
    const _headerColor = Colors.black;
    Widget _home = new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '主页',
          style: new TextStyle(color: _headerColor),
        ),
        backgroundColor: Colors.white,
        leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: _headerColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu, color: _headerColor), onPressed: null),
        ],
      ),
      body: _body(),
      drawer: new Drawer(
        child: new Text('aaa'),
      ),
    );

    return MaterialApp(
      title: 'hello',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: _home,
    );
  }

  Widget _body() {
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[300], width: 4);
    return new Center(
      child: new Container(
        height: 400.0,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border(
            left: _outBorderSide,
            right: _outBorderSide,
            top: _outBorderSide,
            bottom: _outBorderSide,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new Column(
          children: <Widget>[
            _column(_columnText1()),
            _column(_columnText2()),
            _column(_columnText3()),
            _column(_columnText4()),
          ],
        ),
      ),
    );
  }

  Widget _column(Widget child) {
    return new Container(
        width: 250.0,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          border: Border(
            left: this._columnBorderSide,
            right: this._columnBorderSide,
            top: this._columnBorderSide,
            bottom: this._columnBorderSide,
          ),
        ),
        child: child);
  }

  Widget _columnText1() {
    return new Text(
      'Starwberry Pavlova',
      textAlign: TextAlign.center,
      style: new TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
    );
  }

  Widget _columnText2() {
    return new Text(
      'English is the language of the indo-european - Germanic family of languages, consisting of 26 letters derived from the Latin alphabet, which is derived from the Greek alphabet, which is derived from the Phoenician alphabet.It is also a widely used language in the world.',
      softWrap: true,
      style: new TextStyle(color: this._textColor),
    );
  }

  Widget _columnText3() {
    Icon _starIcon = new Icon(
      Icons.star,
      size: 18,
      color: Colors.grey[600],
    );
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Row(
          children: <Widget>[
            _starIcon,
            _starIcon,
            _starIcon,
            _starIcon,
            _starIcon,
          ],
        ),
        new Text(
          '170 Reviews',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: this._textColor,
              fontSize: 12),
        )
      ],
    );
  }

  Widget _columnText4() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _bottomIcon(Icons.cloud, 'PREP', '25 min'),
        _bottomIcon(Icons.star, 'COOK', '1hr'),
        _bottomIcon(Icons.wb_sunny, 'FEEDS', '4-6'),
      ],
    );
  }

  Widget _bottomIcon(IconData icon, String text1, String text2) {
    TextStyle _textStyle = new TextStyle(
        color: this._textColor, fontSize: 12, fontWeight: FontWeight.w600);
    return new Column(
      children: <Widget>[
        new Icon(
          icon,
          color: Colors.grey[500],
          size: 18,
        ),
        new Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: new Text(
            text1,
            style: _textStyle,
          ),
        ),
        new Text(
          text2,
          style: _textStyle,
        )
      ],
    );
  }
}
