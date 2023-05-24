//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

const _kDefaultFontFamily = 'NunitoSans';

/// App text style.
// ignore_for_file: prefer-match-file-name
enum AppTextStyle {
  regular11(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontSize: 11,
    ),
  ),
  regular12(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontSize: 12,
      height: 14 / 12,
    ),
  ),
  regular13(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontSize: 13,
      height: 1.17,
    ),
  ),
  regular14(TextStyle(fontSize: 14, height: 1.4)),
  regular15(
    TextStyle(
      fontSize: 15,
      fontFamily: _kDefaultFontFamily,
      height: 0.9,
    ),
  ),
  regular16(
    TextStyle(
      fontSize: 16,
      fontFamily: _kDefaultFontFamily,
    ),
  ),
  regular18(
    TextStyle(
      fontSize: 18,
      fontFamily: _kDefaultFontFamily,
    ),
  ),
  regular20(
    TextStyle(
      fontSize: 20,
      fontFamily: _kDefaultFontFamily,
    ),
  ),

  medium12(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 11.48 / 12,
    ),
  ),
  medium13(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 13,
      height: 0.85,
    ),
  ),
  medium14(
    TextStyle(
      fontSize: 14,
      height: 1.4,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
    ),
  ),
  medium15(
    TextStyle(
      fontSize: 15,
      height: 0.93,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
    ),
  ),
  medium16(
    TextStyle(
      fontSize: 16,
      height: 1.24,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
    ),
  ),
  medium18(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
  ),
  medium20(
    TextStyle(
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  ),

  bold10(
    TextStyle(
      fontSize: 10,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w700,
    ),
  ),

  bold11(
    TextStyle(
      fontSize: 11,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w700,
    ),
  ),

  bold14(
    TextStyle(
      fontSize: 14,
      height: 1.4,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w700,
    ),
  ),
  bold16(
    TextStyle(
      fontSize: 16,
      fontFamily: _kDefaultFontFamily,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}
