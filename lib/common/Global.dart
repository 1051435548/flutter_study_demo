import 'package:flutter/material.dart';


class Global {
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static const loginURL = 'http://api.10niu.cn';

  static bool isLogin = false;
}
