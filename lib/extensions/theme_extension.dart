import 'package:flutter/material.dart';
import 'package:nadrus_parent_app/config/instance_config.dart';
import 'package:nadrus_parent_app/controllers/theme_controller.dart';

extension ThemeUtils on ThemeData {
  /// get current theme textColor
  Color? get textColor => textTheme.bodySmall?.color;

  /// if applied theme is dark theme
  bool isDark() =>
      findInstance<ThemeController>().themeMode.value == ThemeMode.dark;
}
