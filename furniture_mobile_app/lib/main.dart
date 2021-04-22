import 'package:flutter/material.dart';
import 'package:furniture_mobile_app/product/managers/basket_manager.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'features/home/products_home/view/products_home_view.dart';
import 'product/theme/theme_manager.dart';
import 'core/constants/app_constants.dart';
import 'core/init/lang/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
        ChangeNotifierProvider(create: (_) => BasketManager()),
        // Provider.value(value: BasketManager()),
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
  Widget build(BuildContext context ) {
    return MaterialApp(
      title: 'Furniture App',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeManager>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeView(),
    );
  }
}