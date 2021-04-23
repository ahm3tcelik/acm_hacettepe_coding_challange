import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThemeData = ThemeData(
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    primaryColorDark: colorScheme.primaryVariant,
    primaryColorLight: colorScheme.primaryVariant,
    cardColor: colorScheme.background,
    primaryIconTheme: IconThemeData(color: colorScheme.onPrimary),
    iconTheme: IconThemeData(
      color: colorScheme.onPrimary,
    ),
    accentColor: colorScheme.secondary,
    backgroundColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    appBarTheme: AppBarTheme(
      color: colorScheme.background,
      brightness: Brightness.light,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: colorScheme.onBackground,
        opacity: 0.8
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.primary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme:
      IconThemeData(color: colorScheme.onPrimary, opacity: 1),
      unselectedIconTheme: IconThemeData(
        color: colorScheme.onPrimary,
        opacity: 0.4
      ),
    ),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))))),
    chipTheme: ThemeData.light().chipTheme.copyWith(
        selectedColor: colorScheme.primary,
        backgroundColor: colorScheme.background,
        labelStyle: textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w400, color: colorScheme.onPrimary),
        pressElevation: 1),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: colorScheme.onSecondary),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        isDense: true),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    accentTextTheme: textTheme,
    brightness: Brightness.light);

final colorScheme = ColorScheme.light(
    primary: Color(0xFF44C551),
    primaryVariant: Color(0xFF009321),
    secondary: Color(0xFFF1F0F5),
    secondaryVariant: Color(0xFFF1F0F5),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onSurface: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light);

final textTheme = TextTheme(
  headline1: GoogleFonts.rubik(
      fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.rubik(
      fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.rubik(fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.rubik(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.rubik(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.rubik(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.rubik(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.rubik(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.rubik(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.rubik(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.rubik(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.rubik(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
).apply(
    displayColor: colorScheme.onBackground,
    bodyColor: colorScheme.onBackground);
