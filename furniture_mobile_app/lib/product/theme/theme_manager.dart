import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/init/theme/furniture_theme.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData _currentTheme = furnitureThemeData;

  ThemeData get currentTheme => _currentTheme;

  ThemeDataEnum _themeDataEnum = ThemeDataEnum.FURNITURE_LIGHT;

  void changeTheme() {
    switch (_themeDataEnum) {
      case ThemeDataEnum.FURNITURE_LIGHT:
        _currentTheme = ThemeData.dark();
        return;
      case ThemeDataEnum.LIGHT:
        _currentTheme = ThemeData.light();
        return;
      case ThemeDataEnum.DARK:
        _currentTheme = ThemeData.dark();
        return;
    }
  }
}

enum ThemeDataEnum { FURNITURE_LIGHT, LIGHT, DARK }