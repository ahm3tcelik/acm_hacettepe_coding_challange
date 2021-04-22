import 'package:flutter/material.dart';

// pub run easy_localization:generate -S "assets/lang" -f keys -O "lib/core/init/lang" -o locale_keys.g.dart

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  final enLocale = Locale('en', 'US');

  List<Locale> get supportedLocales => [enLocale];
}