import 'dart:math';

import 'package:Flutter/common/Global.dart';
import 'package:Flutter/community/app.dart';
import 'package:Flutter/demo/animation1.dart';
import 'package:Flutter/demo/animation2.dart';
import 'package:Flutter/demo/animationStateList.dart';
import 'package:Flutter/demo/listview.dart';
import 'package:Flutter/demo/mystyle.dart';
import 'package:Flutter/demo/mystyle2.dart';
import 'package:Flutter/demo/youngademo1.dart';
import 'package:Flutter/provider/themeProvider.dart';
import 'package:Flutter/utils/LocalStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var theme = ThemeProvide();

  int themeIndex = await getTheme();

  runApp(MultiProvider(
    providers: [
//      ChangeNotifierProvider.value(value: theme),
      ChangeNotifierProvider(
        create: (_) => ThemeProvide(),
      ),
    ],
    child: CommunityApp(themeIndex),
  ));
}

Future<int> getTheme() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt("themeIndex");
  return null == themeIndex ? 0 : themeIndex;
}

