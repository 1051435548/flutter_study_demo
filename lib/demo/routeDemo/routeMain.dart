import 'package:Flutter/demo/routeDemo/routeFour.dart';
import 'package:Flutter/demo/routeDemo/routeGenerate.dart';
import 'package:Flutter/demo/routeDemo/routeOne.dart';
import 'package:Flutter/demo/routeDemo/routeThree.dart';
import 'package:Flutter/demo/routeDemo/routeTwo.dart';
import 'package:Flutter/demo/routeDemo/routeUnknown.dart';
import 'package:flutter/material.dart';

class RouteMain extends StatefulWidget {
  @override
  _RouteMainState createState() => _RouteMainState();
}

class _RouteMainState extends State<RouteMain> {
  @override
  Widget build(BuildContext context) {
    ///[MaterialApp]配置顶级[Navigator]来搜索路由按以下顺序:
    ///1. 对于' / '路由，如果非空，则使用[home]属性。
    ///2. 否则，如果[routes]表有一个路由条目，则使用它。
    ///3.否则，如果提供了[onGenerateRoute]，则调用它。它应该返回
    ///对于任何不被[home]和[routes]处理的_valid_路由，都是非空值。
    ///4. 最后，如果所有其他方法都失败[onUnknownRoute]将被调用。
    return MaterialApp(
      title: 'route main',
      routes: _routes(),

      /// initialRoute中指定的路由，如果在routes中被找到则将其作为初始路由，否则将指定 '/'为初始路由
      /// 如果routes中不存在'/'且没有home属性，则程序崩溃
      initialRoute: '/',
      onGenerateRoute: (setting) => _onGenerateRoute(setting),
      onUnknownRoute: (setting) => _onUnknownRoute(setting),

      /// home属性跟routes中的 '/'不能同时出现，否则程序崩溃
//      home: RouteTwo(),
    );
  }

  _routes() {
    return {
      '/': (context) => RouteOne(),
      '/two': (context) => RouteTwo(),
      '/three': (context) => RouteThree(),
      '/four': (context) => RouteFour(),
    };
  }

  /// Navigator.pushNamed到routes中不存在的路由名时会执行该方法
  _onGenerateRoute(RouteSettings setting) {
    print("是否初始路由: + ${setting.isInitialRoute}");
    print("要跳转的路由名key: + ${setting.name}");
    return MaterialPageRoute(builder: (context) {
      return RouteGenerate();
    });
  }

  /// 所有路由相关都失败时调用该方法
  _onUnknownRoute(RouteSettings setting) {
    print("是否初始路由: + ${setting.isInitialRoute}");
    print("要跳转的路由名key: + ${setting.name}");
    return MaterialPageRoute(builder: (context) {
      return RouteUnknown();
    });
  }
}
