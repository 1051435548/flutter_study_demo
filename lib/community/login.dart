import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          '登录',
          style: new TextStyle(color: Colors.grey[500]),
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new OutlineButton(
          onPressed: () {},
          child: new Text('Open'),
        ),
      ),
    );
  }
}
