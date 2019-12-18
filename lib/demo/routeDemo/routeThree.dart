import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第三页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/four');
                },
                child: Text('点我去下一个页面'),
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  /// 第一个路由参数 跳转后的路由
                  /// 第二个路由参数 返回后的路由
                  /// 将两者间的路由栈全部清空
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/four',
                    ModalRoute.withName('/two'),
                  );
                },
                child: Text(
                  '下个路由将与其返回的路由中间的栈全部清空',
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
