import 'dart:convert';

import 'package:Flutter/utils/HttpUtils.dart';
import 'package:Flutter/utils/LocalStore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'binduser.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

Dio dio = Dio();

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  static const String routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  var _usernameText = '';
  var _passwordText = '';

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('You selected: $value'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
    return Scaffold(
      /// 防止点击输入框时页面被压缩
      resizeToAvoidBottomInset: false,
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
        _login(context);
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
        onPressed: () {
          _register(context);
        },
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
            onChanged: (text) {
              setState(() {
                _usernameText = text;
              });
            },
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
            obscureText: _obscureText,
            onChanged: (text) {
              setState(() {
                _passwordText = text;
              });
            },
            decoration: InputDecoration(
//              border: OutlineInputBorder(),
              hintText: '请输入密码',
              hintStyle: new TextStyle(fontSize: 14, color: Colors.grey[400]),
              suffixIcon: GestureDetector(
                dragStartBehavior: DragStartBehavior.down,
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
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
//    TextStyle _textStyle = new TextStyle(
//        color: Colors.teal, fontSize: 12, fontWeight: FontWeight.w600);
    return new IconButton(icon: Image.asset(icon), onPressed: () {});
  }

  // ignore: slash_for_doc_comments
  /**
   * 登录的方法
   */
  _login(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);
    const url = 'http://192.168.50.104:8181/authenticate';
    HttpUtils.post(
      url,
      pathParams: null,
      data: {"username": _usernameText, "password": _passwordText},
    ).then((res) {
      var decode = json.encode(res);
      LocalStore.setLocalStorage('auth', decode).then((isOk) {
        print('保存数据是否成功：$isOk');
        if (isOk) {
          Navigator.pushNamed(context, BindUser.routeName);
        }
      });
    }).catchError((Object error) {
      print('Http is catch：$error');
      showDemoDialog<DialogDemoAction>(
        context: context,
        child: AlertDialog(
          title: const Text('登录失败'),
          content: Text(
            '请输入正确的账号和密码',
            style: dialogTextStyle,
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('确定'),
              onPressed: () {},
            )
          ],
        ),
      );
    }).whenComplete(() {
      print('Http is Complete');
    });
  }

  // ignore: slash_for_doc_comments
  /**
   * 注册的方法
   */
  _register(BuildContext context) {}
}
