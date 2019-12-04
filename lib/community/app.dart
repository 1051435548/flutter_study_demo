import 'package:Flutter/community/opendoor.dart';
import 'package:flutter/material.dart';

import 'route.dart';

class CommunityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CommunityApp',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: OpenDoor(),
      routes: _buildRoutes(),
    );
  }

  _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      allRouteList,
      key: (route) => '${route.routeName}',
      value: (route) => route.builderRoute,
    );
  }
}
