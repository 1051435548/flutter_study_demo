import 'package:flutter/material.dart';

class Animation2 extends StatelessWidget {
  const Animation2() : super();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new YoungApp(),
    );
  }
}

class YoungApp extends StatefulWidget {
  @override
  _YoungAppState createState() => _YoungAppState();
}

class _YoungAppState extends State<YoungApp> {
  AlignmentGeometry _alignmentOne = Alignment.topRight;
  AlignmentGeometry _alignmentTwo = Alignment.topLeft;

  _changAlignment() {
    _changOne();
    _changeTwo();
  }

  _changOne() {
    setState(() {
      _alignmentOne = _alignmentOne == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  _changeTwo() {
    setState(() {
      _alignmentTwo = _alignmentTwo == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('animation biubiubiu'),
      ),
      body: _ybody(),
    );
  }

  Widget _ybody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width, //屏幕最大宽度
          color: Colors.blue[50],
          child: AnimatedAlign(
            alignment: _alignmentOne,
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 3),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width, //屏幕最大宽度
          color: Colors.blue[50],
          child: AnimatedAlign(
            alignment: _alignmentTwo,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(seconds: 3),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            _changAlignment();
          },
          child: Text('Click Me!'),
        ),
      ],
    );
  }
}
