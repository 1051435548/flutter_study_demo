

class Global {

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static const loginURL = 'http://api.10niu.cn';

  static bool isLogin = false;
}
