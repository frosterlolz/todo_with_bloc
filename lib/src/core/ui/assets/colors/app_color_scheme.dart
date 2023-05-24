import 'package:flutter/material.dart';
import 'package:todo_with_bloc/src/core/ui/assets/colors/app_colors.dart';

//ignore_for_file: member-ordering

/// App color scheme.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// The base color for app.
  final Color primary;

  /// The color of the elements that appears on top of a [primary].
  final Color onPrimary;

  /// A secondary color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color secondary;

  /// The color of the elements that appears on top of a [secondary].
  final Color onSecondary;

  /// The color of inactive icon (in buttons/switchers... etc)
  final Color inactiveSecondary;

  /// The color of grabber and rating bar
  final Color grabber;

  /// The color of subtitle body text
  final Color subtitle;

  /// The color of on subtitle body text
  final Color onSubtitle;

  /// Surface colors affect surfaces of components, such as cards, sheets, and menus.
  final Color surface;

  /// The color of the elements that appears on top of a [surface].
  final Color onSurface;

  /// The background color appears behind scrollable content.
  final Color background;

  /// The color of the elements that appears on top of a [background].
  final Color onBackground;

  /// Color for show errors.
  final Color error;

  /// The color of the elements that appears on top of a [error].
  final Color onError;

  /// Color for show selected items.
  final Color selectedItem;

  /// Color for show unselected items.
  final Color unselectedItem;

  /// Base light theme of the app.
  AppColorScheme.light()
      : primary = AppColors.corpDark.value,
        onPrimary = AppColors.white.value,
        secondary = AppColors.corpLight.value,
        onSecondary = AppColors.appBarFgColor.value,
        inactiveSecondary = AppColors.labelGrey.value,
        subtitle = AppColors.subtitleGrey.value,
        onSubtitle = AppColors.bodyTextGrey.value,
        grabber = AppColors.grabberGrey.value,
        surface = AppColors.white.value,
        onSurface = AppColors.black.value,
        background = AppColors.scaffoldBgGrey.value,
        onBackground = AppColors.black.value,
        error = AppColors.freeSpeechRed.value,
        onError = AppColors.alarmRed.value,
        selectedItem = AppColors.corpDark.value,
        unselectedItem = AppColors.darkGrey.value;

  /// Dark theme of the app.
  AppColorScheme.dark()
      : primary = AppColors.white.value,
        onPrimary = AppColors.darkGrey.value,
        secondary = AppColors.appBarFgColor.value,
        onSecondary = AppColors.white.value,
        inactiveSecondary = AppColors.labelGrey.value,
        subtitle = AppColors.labelGrey.value,
        onSubtitle = AppColors.bodyTextGrey.value,
        grabber = AppColors.grabberGrey.value,
        surface = AppColors.oxfordBlue.value,
        onSurface = AppColors.darkGrey.value,
        background = AppColors.jaguar.value,
        onBackground = AppColors.darkGrey.value,
        error = AppColors.freeSpeechRed.value,
        onError = AppColors.darkGrey.value,
        selectedItem = AppColors.white.value,
        unselectedItem = AppColors.subtitleGrey.value;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.inactiveSecondary,
    required this.subtitle,
    required this.onSubtitle,
    required this.grabber,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.selectedItem,
    required this.unselectedItem,
  });

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;

    return copyWith(
      primary: Color.lerp(primary, other.primary, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      inactiveSecondary:
          Color.lerp(inactiveSecondary, other.inactiveSecondary, t),
      subtitle: Color.lerp(subtitle, other.subtitle, t),
      onSubtitle: Color.lerp(onSubtitle, other.onSubtitle, t),
      grabber: Color.lerp(grabber, other.grabber, t),
      surface: Color.lerp(surface, other.surface, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      selectedItem: Color.lerp(selectedItem, other.selectedItem, t),
      unselectedItem: Color.lerp(unselectedItem, other.unselectedItem, t),
    );
  }

  /// Return color scheme for app from context
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>() ??
      _throwThemeExceptionFromFunc(context);

  @override
  // ignore: long-parameter-list
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? inactiveSecondary,
    Color? subtitle,
    Color? onSubtitle,
    Color? grabber,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
    Color? selectedItem,
    Color? unselectedItem,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      inactiveSecondary: inactiveSecondary ?? this.inactiveSecondary,
      subtitle: subtitle ?? this.subtitle,
      onSubtitle: onSubtitle ?? this.onSubtitle,
      grabber: grabber ?? this.grabber,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      selectedItem: selectedItem ?? this.selectedItem,
      unselectedItem: unselectedItem ?? this.unselectedItem,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppColorScheme не найдена в $context');
