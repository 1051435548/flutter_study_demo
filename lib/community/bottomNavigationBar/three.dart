import 'package:Flutter/demo/scrollZoomView.dart';
import 'package:Flutter/demo/yScrollZommView2.dart';
import 'package:Flutter/demo/yScrollZoomView1.dart';
import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScrollZoomView();
              }));
            },
            child: Text('点我去滑动缩放1'),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return YScrollZoomView1();
              }));
            },
            child: Text('点我去滑动缩放2'),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return YScrollZoomView2();
              }));
            },
            child: Text('点我去滑动缩放3'),
          ),
        ],
      ),
    );
  }
}
