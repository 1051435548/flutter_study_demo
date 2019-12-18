import 'package:flutter/material.dart';

class RouteFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第四页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('返回上一页'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  '一直返回到目标页',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  /// 该路由返回至目标路由，将当前路由与目标路由中间的栈都清空
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
