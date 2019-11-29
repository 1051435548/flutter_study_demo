import 'package:Flutter/community/bindhouse.dart';
import 'package:Flutter/community/binduser.dart';
import 'package:flutter/cupertino.dart';
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
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
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
      body: new Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: new Container(
          height: 450.0,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border(
              left: _outBorderSide,
              right: _outBorderSide,
              top: _outBorderSide,
              bottom: _outBorderSide,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _usernameWidget(),
              _passwordWidget(),
              _loginButton(context),
              _iconsWidget(),
              _registerButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 登录按钮
   */
  Widget _loginButton(BuildContext context) {
    return new MaterialButton(
      minWidth: double.infinity,
      height: 50.0,
      color: Colors.teal,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, BindUser.routeName);
      },
      child: Text(
        "登录",
        style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 注册按钮
   */
  Widget _registerButton(BuildContext context) {
    return new SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          "注册",
          style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        color: Colors.orange,
        textColor: Colors.white,
      ),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 账号输入框
   */
  Widget _usernameWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '账    号：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              hintText: '请输入账号',
//              prefixIcon: Icon(Icons.person),
              hintText: '用户名/手机/邮箱',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 密码输入框
   */
  Widget _passwordWidget() {
    return new Row(
      children: <Widget>[
        new Text(
          '密    码：',
          style: new TextStyle(
              fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w500),
        ),
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
              hintText: '请输入密码',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
//              labelText: '',
//              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 第三方登录图标
   */
  Widget _iconsWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _bottomIcon('images/facebook.png'),
        _bottomIcon('images/ins.png'),
        _bottomIcon('images/linkedin.png'),
        _bottomIcon('images/twitter.png'),
      ],
    );
  }

  Widget _bottomIcon(String icon) {
    TextStyle _textStyle = new TextStyle(
        color: Colors.teal, fontSize: 12, fontWeight: FontWeight.w600);
    return new IconButton(icon: Image.asset(icon), onPressed: () {});
  }
}
