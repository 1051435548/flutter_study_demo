import 'package:Flutter/utils/ToastUtil.dart';
import 'package:flutter/material.dart';

class DoubleExit {
  static int last = 0;

  /// 双击返回退出应用
  static Future<bool> doubleClickBack(BuildContext context) {
    print('触发双击退出事件');
    //计算两次时间间隔
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 2000) {
      last = DateTime.now().millisecondsSinceEpoch;
      ToastUtil.show(context: context, msg: '再次点击返回键退出应用');
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
