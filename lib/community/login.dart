import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  static const String routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          '登录',
          style:
              new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new Padding(
          padding: EdgeInsets.all(24.0),
          child: new Column(
            children: <Widget>[
              _usernameWidget(),
              _passwordWidget(),
              _loginButton(),
              _iconsWidget(),
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return new MaterialButton(
      minWidth: double.infinity,
      height: 50.0,
      color: Colors.teal,
      textColor: Colors.white,
      onPressed: () {},
      child: new Text('登录'),
    );
  }

  Widget _registerButton() {
    return new SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: () {},
        child: Text("注册"),
        color: Colors.orange,
        textColor: Colors.white,
      ),
    );
  }

  Widget _usernameWidget() {
    return new Row(
      children: <Widget>[
//        new Text(
//          '账号：',
//          style: new TextStyle(fontSize: 16, color: Colors.grey[500]),
//        ),
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '请输入账号',
              labelText: '用户名/手机/邮箱',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordWidget() {
    return new TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '请输入密码',
        labelText: '密码',
        prefixIcon: Icon(Icons.lock_outline),
      ),
    );
  }

  Widget _iconsWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _bottomIcon(Icons.cloud),
        _bottomIcon(Icons.cloud),
        _bottomIcon(Icons.cloud),
        _bottomIcon(Icons.cloud),
      ],
    );
  }

  Widget _bottomIcon(IconData icon) {
    TextStyle _textStyle = new TextStyle(
        color: Colors.teal, fontSize: 12, fontWeight: FontWeight.w600);
    return new Column(
      children: <Widget>[
        new Icon(
          icon,
          color: Colors.grey[500],
        ),
      ],
    );
  }
}
