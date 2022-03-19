import 'package:flutter/material.dart';
import 'package:inventory/app/core/theme/text_theme.dart';
import 'package:inventory/app/core/value/colors.dart';
import 'package:inventory/app/core/value/dimens.dart';

final appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onSecondary: Colors.white,
  ),
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppDimens.defaultPadding * 2,
      //vertical: AppDimens.defaultPadding * 0.8,
    ),
    filled: true,
    fillColor: Colors.grey.shade200,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: AppDimens.defaultBorderRadius,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: AppDimens.defaultBorderRadius,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: AppDimens.defaultBorderRadius,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: AppDimens.defaultBorderRadius,
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.defaultPadding * 2,
        vertical: AppDimens.defaultPadding * 3,
      ),
    ),
  ),
);
