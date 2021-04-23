import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/init/theme/light_theme.dart';

class ThemeManager extends ChangeNotifier {
  ThemeData _currentTheme = lightThemeData;

  ThemeData get currentTheme => _currentTheme;

  final _themeDataEnum = ThemeDataEnum.LIGHT;

  void changeTheme() {
    switch (_themeDataEnum) {
      case ThemeDataEnum.LIGHT:
        _currentTheme = lightThemeData;
        break;
      case ThemeDataEnum.DARK:
        _currentTheme = ThemeData.dark();
        break;
    }
    notifyListeners();
  }
}

enum ThemeDataEnum { LIGHT, DARK }