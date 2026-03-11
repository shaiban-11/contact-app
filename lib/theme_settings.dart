import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  // Load saved theme when app starts
  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool("Is_dark") ?? false;

    if (isDark) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  // Toggle theme
  void toggletheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_currentTheme.brightness == Brightness.light) {
      _currentTheme = ThemeData.dark();
      await prefs.setBool("Is_dark", true);
    } else {
      _currentTheme = ThemeData.light();
      await prefs.setBool("Is_dark", false);
    }

    notifyListeners();
  }
}
