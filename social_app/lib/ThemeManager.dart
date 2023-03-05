// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManger with ChangeNotifier {
  ThemeManger() {
    getPrefs();
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() async {
    bool isDark = _themeMode == ThemeMode.dark;
    isDark ? _themeMode = ThemeMode.light : _themeMode = ThemeMode.dark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', !isDark);
  }

  getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if (isDark == null) {
      isDark = false;
      await prefs.setBool('isDark', isDark);
    }
    isDark ? _themeMode = ThemeMode.dark : ThemeMode.light;
    print(prefs.getBool('isDark'));
    notifyListeners();
  }
}
