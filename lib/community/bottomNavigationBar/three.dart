import 'package:Flutter/demo/routeParam.dart';
import 'package:Flutter/demo/scrollZoomView.dart';
import 'package:Flutter/demo/yScrollZommView2.dart';
import 'package:Flutter/demo/yScrollZoomView1.dart';
import 'package:flutter/cupertino.dart';
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
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return ScrollZoomView();
              }));
            },
            child: Text('点我去滑动缩放1（IOS风格）'),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return FadeTransition(
                      //使用渐隐渐入过渡,
                      opacity: animation,
                      child: YScrollZoomView1(), //路由B
                    );
                  },
                ),
              );
            },
            child: Text('点我去滑动缩放2（渐入效果）'),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return YScrollZoomView2();
              }));
            },
            child: Text('点我去滑动缩放3（安卓风格）'),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () {
              _goTo();
            },
            child: Text('点我传参数给下个页面'),
          ),
        ],
      ),
    );
  }

  _goTo() async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RouteParam(
        username: "我是传过来的username",
        nickname: "我是传过来的nickname",
      );
    }));

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "返回的结果",
              style: TextStyle(color: Colors.black),
            ),
            content: Text(result),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("确定"))
            ],
          );
        });
  }
}
