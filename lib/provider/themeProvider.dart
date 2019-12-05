import 'package:flutter/material.dart';

class ThemeProvide extends ChangeNotifier {
  int _themeIndex;

  int get value => _themeIndex;

  ThemeProvide();

  void setTheme(int index) async {
    _themeIndex = index;
    notifyListeners();
  }
}
