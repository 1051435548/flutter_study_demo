import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class RouteTwo extends StatefulWidget {
  final String username;
  final String nickname;

  RouteTwo({
    Key key,
    this.username,
    this.nickname,
  }) : super(key: key);

  @override
  _RouteTwoState createState() => _RouteTwoState();
}

class _RouteTwoState extends State<RouteTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.username == null ? "" : widget.username),
              Text(widget.nickname == null ? "" : widget.nickname),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/three');
                },
                child: Text('点我去下一个页面'),
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  /// 下一个路由将替换当前路由
                  Navigator.pushReplacementNamed(context, '/four');
                },
                child: Text(
                  '下一个路由将替换当前路由',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  /// 先返回上一页路由再进入目标路由
                  Navigator.popAndPushNamed(context, '/four');
                },
                child: Text(
                  '先返回上一页路由再进入目标路由',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text(
                  '点我带参数返回',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    '这是返回去的参数',
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.maybePop(context).then((isPop) async {
                    ToastUtil.show(context: context, msg: isPop.toString());
                    if (!isPop) {
                      await Future.delayed(Duration(milliseconds: 1000));
                      ToastUtil.show(context: context, msg: '不能返回，做一些其他处理');
                    }
                  });
                },
                child: Text(
                  '能否返回？',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
