import 'package:flutter/material.dart';
import 'package:todo_with_bloc/src/core/ui/assets/colors/app_color_scheme.dart';
import 'package:todo_with_bloc/src/core/ui/assets/text/text_extention.dart';
import 'package:todo_with_bloc/src/core/utils/constants.dart';

enum AppTheme { light, dark }

abstract class AppThemeData {
  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateColor.resolveWith((states) => _lightColorScheme.primary),
    ),
    unselectedWidgetColor: _lightColorScheme.secondary,
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: _lightColorScheme.grabber,
      dragHandleSize: const Size(45, 5),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: _lightColorScheme.onPrimary,
      foregroundColor: _lightColorScheme.onSecondary,
      centerTitle: false,
      titleTextStyle: _textTheme.medium20.copyWith(
        color: _lightColorScheme.onSecondary,
      ),
    ),
    applyElevationOverlayColor: false,
    badgeTheme: BadgeThemeData(
      backgroundColor: _lightColorScheme.onError,
      textColor: _lightColorScheme.onPrimary,
    ),
    cardColor: _lightColorScheme.onPrimary,
    cardTheme: CardTheme(
      surfaceTintColor: _lightColorScheme.onPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: _textTheme.medium16,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    iconTheme: IconThemeData(
      color: _lightColorScheme.unselectedItem,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      labelStyle: _textTheme.regular14.copyWith(
        color: _lightColorScheme.inactiveSecondary,
      ),
      border: InputBorder.none,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: _lightColorScheme.unselectedItem,
      textColor: _lightColorScheme.unselectedItem,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kMainHorizontalPadding,
      ),
    ),
    fontFamily: 'NunitoSans',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: _lightColorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: _lightColorScheme.selectedItem,
      unselectedItemColor: _lightColorScheme.unselectedItem,
      selectedLabelStyle: _textTheme.bold11,
      unselectedLabelStyle: _textTheme.regular11,
      // selectedIconTheme: ,
      // selectedIconTheme:
      //     IconThemeData(size: 24, color: _lightColorScheme.selectedItem),
      // unselectedIconTheme:
      //     const BottomNavigationBarThemeData().unselectedIconTheme,
    ),
    extensions: [_lightColorScheme, _textTheme],
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: _darkColorScheme.onPrimary,
      foregroundColor: _darkColorScheme.onSecondary,
      centerTitle: false,
      titleTextStyle: _textTheme.medium20.copyWith(
        color: _darkColorScheme.onSecondary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: _darkColorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: _darkColorScheme.selectedItem,
      unselectedItemColor: _darkColorScheme.unselectedItem,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.error,
      onError: _darkColorScheme.onError,
      background: _darkColorScheme.background,
      onBackground: _darkColorScheme.onBackground,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    fontFamily: 'NunitoSans',
    extensions: [_darkColorScheme, _textTheme],
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
  static final _textTheme = AppTextTheme.base();
}
