import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:provider/provider.dart';

import 'core/init/lang/locale_keys.g.dart';
import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'features/home/products_home/view/products_home_view.dart';
import 'product/managers/basket_manager.dart';
import 'product/managers/user_manager.dart';
import 'product/managers/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dot_env.load(fileName: '.env');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => BasketManager()),
        ChangeNotifierProvider(create: (_) => UserManager()),
      ],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_ASSETS_PATH,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.app_title,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeManager>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeView(),
    );
  }
}
