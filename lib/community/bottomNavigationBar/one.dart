import 'package:flutter/material.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
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
}
