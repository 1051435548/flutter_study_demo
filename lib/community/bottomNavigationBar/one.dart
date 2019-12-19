import 'dart:convert';
import 'dart:io';

import 'package:Flutter/models/index.dart';
import 'package:Flutter/utils/ToastUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  String _token = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 60.0),
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          Text('请在控制台查看输出'),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            child: Text('点我1'),
            color: Colors.blue,
            minWidth: size.width * 0.8,
            onPressed: () {
              _pressed1();
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            child: Text('点我2'),
            color: Colors.red,
            minWidth: size.width * 0.8,
            onPressed: () {
              _pressed2();
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          MaterialButton(
            child: Text('模拟登录'),
            color: Colors.yellow,
            minWidth: size.width * 0.8,
            onPressed: () {
              _pressed3();
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            child: Text('模拟获取数据'),
            color: Colors.brown,
            minWidth: size.width * 0.8,
            onPressed: () {
              _pressed4();
            },
          ),
        ],
      ),
    );
  }

  void _pressed1() {
    print("执行异步方法前：" + DateTime.now().toString());
    f1()
        .then((i) {
          print("******then方法：" + DateTime.now().toString());
        })
        .timeout(Duration(seconds: 4))
        .catchError((error) {
          print("******执行出错：" + DateTime.now().toString());
          print(error);
        })
        .whenComplete(() {
          print("******执行完成：" + DateTime.now().toString());
        });
    print("执行异步方法后：" + DateTime.now().toString());
  }

  Future f1() async {
    debugPrint("******开始时间：" + DateTime.now().toString());
    await Future.delayed(Duration(seconds: 5));
    debugPrint("******结束时间：" + DateTime.now().toString());

    return 0;
  }

  void _pressed2() {
    f4().then((i) {
      print(i);
      f5().then((i) {
        print(i);
        f2().then((i) {
          print(i);
        });
      });
    });
    f3().then((i) {
      print('3');
    });
  }

  Future f5() async {
    return Future.value('5');
  }

  Future f4() async {
    return Future.value('4');
  }

  Future f3() async {
    await Future.delayed(Duration(seconds: 5));
  }

  Future f2() async {
    return Future.value('2');
  }

  void _pressed3() async {
    const url = "http://192.168.50.104:8181/authenticate";
    const data = {"username": "test", "password": "test"};
    Dio dio = Dio();
    await dio
        .post(
      url,
      data: data,
      options: Options(
        contentType: ContentType.json,
        responseType: ResponseType.json,
      ),
    )
        .then((res) {
      Auth auth = new Auth.fromJson(json.decode(res.toString()));
      ToastUtil.show(context: context, msg: "token: ${auth.token}");
      setState(() {
        _token = auth.token;
      });
    });
  }

  void _pressed4() async {
    const url = "http://192.168.50.104:8181";
    String token = "Bearer " + _token;
    print(token);
    BaseOptions options = BaseOptions(
        method: "get",
        baseUrl: url,
        headers: {HttpHeaders.authorizationHeader: token});

    Dio dio = Dio(options);
    dio.options.headers[HttpHeaders.authorizationHeader] = token;
    await dio.get('/userInfo').then((res) {
      print(res.data);
      ToastUtil.show(context: context, msg: res.data.toString());
    }).catchError((error) {
      print('错误：$error');
      ToastUtil.show(context: context, msg: error.toString());
    });
  }
}
