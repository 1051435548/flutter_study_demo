import 'package:Flutter/demo/routeDemo/routeTwo.dart';
import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class RouteOne extends StatelessWidget {
  RouteOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/two');
                },
                child: Text('点我去下一个页面'),
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  /// push一个routes中不存在的路由
                  Navigator.pushNamed(context, '/aaa');
                },
                child: Text(
                  '点我去generate上设置的路由',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  _paramSkip(context);
                },
                child: Text(
                  '点我传递参数给下一个页面',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  /// 能否返回上一页 true：返回  false：另外处理
                  Navigator.maybePop(context).then((isPop) async {
                    ToastUtil.show(context: context, msg: isPop.toString());
                    if (!isPop) {
                      await Future.delayed(Duration(milliseconds: 1000));
                      ToastUtil.show(context: context, msg: '不能返回，做一些其他处理');
                    } else {
                      await Future.delayed(Duration(milliseconds: 1000));
                      ToastUtil.show(context: context, msg: '可以返回，做一些其他处理');
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

  _paramSkip(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RouteTwo(
        /// 传给下个页面的参数
        username: "我是传过来的username",
        nickname: "我是传过来的nickname",
      );
    }));

    /// 弹出上一个页面传来的参数
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
