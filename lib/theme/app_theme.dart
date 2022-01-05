import 'package:beer_not_bear_flutter/theme/color_theme.dart';
import 'package:beer_not_bear_flutter/theme/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    scaffoldBackgroundColor: Colors.white,
    errorColor: AppColors.redError,
    colorScheme: lightColorScheme,
    primarySwatch: AppColors.secondary,
    backgroundColor: AppColors.white,
    inputDecorationTheme: inputTheme);

const InputDecorationTheme inputTheme =
    InputDecorationTheme(border: OutlineInputBorder());
