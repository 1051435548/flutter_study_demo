import 'package:Flutter/common/CustomTheme.dart';
import 'package:Flutter/community/opendoor.dart';
import 'package:Flutter/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'route.dart';

class CommunityApp extends StatelessWidget {
  final int themeIndex;

  CommunityApp(this.themeIndex);

  @override
  Widget build(BuildContext context) {
    ThemeProvide theme = Provider.of<ThemeProvide>(context);
    return MaterialApp(
      title: 'CommunityApp',
      theme: _customTheme(theme),
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

  /// 自定义主题
  ThemeData _customTheme(ThemeProvide theme) {
    return ThemeData(
      primaryColor:
          CustomTheme.themeColor[theme.value != null ? theme.value : themeIndex]
              ["primaryColor"],
      accentColor:
          CustomTheme.themeColor[theme.value != null ? theme.value : themeIndex]
              ["colorAccent"],
      buttonTheme: ButtonThemeData(
          height: 50.0,
          minWidth: double.infinity,
          buttonColor: CustomTheme
                  .themeColor[theme.value != null ? theme.value : themeIndex]
              ["primaryColor"],
          textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
        title: TextStyle(
            color: CustomTheme
                    .themeColor[theme.value != null ? theme.value : themeIndex]
                ["textTitleColor"],
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
