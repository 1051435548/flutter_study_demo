import 'package:flutter/material.dart';

class RouteParam extends StatefulWidget {
  final String username;
  final String nickname;

  RouteParam({
    Key key,
    this.username,
    this.nickname,
  }) : super(key: key);

  @override
  _RouteParamState createState() => _RouteParamState();
}

class _RouteParamState extends State<RouteParam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("接收路由参数"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, '左上角的返回');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.username),
            Text(widget.nickname),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: RaisedButton(
                child: Text('点我带参数返回'),
                onPressed: () {
                  Navigator.pop(context, '这是返回去的参数');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
