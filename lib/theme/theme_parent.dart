import 'package:flutter/material.dart';
import 'package:strava_food_app/theme/theme_dark.dart';
import 'package:strava_food_app/theme/theme_light.dart';

class ThemeParent {
  ThemeData getTheme(bool isDarkMode) {
    dynamic theme = isDarkMode ? ThemeDark() : ThemeLight();
    return ThemeData(
      brightness: theme.brightness,
      primarySwatch: theme.primarySwatch,
    );
  }
}