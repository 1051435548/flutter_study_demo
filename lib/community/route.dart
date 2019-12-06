import 'package:Flutter/community/bindhouse.dart';
import 'package:Flutter/community/binduser.dart';
import 'package:Flutter/community/home.dart';
import 'package:Flutter/community/login.dart';
import 'package:Flutter/community/opendoor.dart';
import 'package:Flutter/community/register.dart';
import 'package:flutter/cupertino.dart';

// ignore: slash_for_doc_comments
/**
 * 路由对象（以后可以扩展属性）
 * 也可以扩展二级路由
 */
class CommunityRoute {
  const CommunityRoute({@required this.routeName, @required this.builderRoute})
      : assert(routeName != null),
        assert(builderRoute != null);

  final String routeName;
  final WidgetBuilder builderRoute;
}

// ignore: slash_for_doc_comments
/**
 * 路由集合
 */
List<CommunityRoute> _buildAllRoutes() {
  final List<CommunityRoute> communityRoutes = <CommunityRoute>[
    CommunityRoute(
        routeName: OpenDoor.routeName,
        builderRoute: (BuildContext context) => const OpenDoor()),
    CommunityRoute(
        routeName: Login.routeName,
        builderRoute: (BuildContext context) => const Login()),
    CommunityRoute(
        routeName: BindUser.routeName,
        builderRoute: (BuildContext context) => const BindUser()),
    CommunityRoute(
        routeName: BindHouse.routeName,
        builderRoute: (BuildContext context) => const BindHouse()),
    CommunityRoute(
        routeName: Register.routeName,
        builderRoute: (BuildContext context) => const Register()),
    CommunityRoute(
        routeName: Home.routeName,
        builderRoute: (BuildContext context) => const Home()),
  ];

  return communityRoutes;
}

final List<CommunityRoute> allRouteList = _buildAllRoutes();
