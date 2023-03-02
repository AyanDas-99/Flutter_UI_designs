// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeManger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode == ThemeMode.light
        ? _themeMode = ThemeMode.dark
        : _themeMode = ThemeMode.light;
    notifyListeners();
  }
}
