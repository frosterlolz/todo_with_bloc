import 'package:flutter/material.dart';

//ignore_for_file: public_member_api_docs

/// Semantic aliases.
/// Replenished as needed.
/// Use only the main palette.
/// http://www.color-blindness.com/color-name-hue/.

enum AppColors {
  /// white to black
  white(Colors.white),
  scaffoldBgGrey(Color(0xFFF2F2F9)),
  corpLight(Color(0xFFE8F6F8)),
  grabberGrey(Color(0xFFD9D9D9)),
  labelGrey(Color(0xFFA5A7AE)),
  subtitleGrey(Color(0xFF9D9D9D)),
  appBarFgColor(Color(0xFF333333)),
  bodyTextGrey(Color(0xFF555555)),
  darkGrey(Color(0xFF4B505D)),
  black(Colors.black),

  /// other colors
  alarmRed(Color(0xFFFF2600)),
  corpDark(Color(0xFF129EB3)),

  /// old colors
  cornflowerBlue(Color(0xFF5E9EED)),
  lightCyan(Color(0xFFC9E9FF)),
  prussianBlue(Color(0xFF000F3D)),
  jaguar(Color(0xFF181719)),
  oxfordBlue(Color(0xFF263238)),
  horizon(Color(0xFF428989)),
  purple(Color(0xFF7A3E93)),
  freeSpeechRed(Color(0xFFB00000)),
  pastelWhite(Color(0xFFFAFAFA)),
  solitude(Color(0xFFE5E8EB));
  // raisinBlack(Color(0xFF212121));

  final Color value;

  const AppColors(this.value);
}
