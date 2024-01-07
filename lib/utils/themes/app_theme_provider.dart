import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';

final appThemeStateNotifierProvider =
    ChangeNotifierProvider((ref) => AppThemeStateNotifier());

class AppThemeStateNotifier extends ChangeNotifier {
  var isDarkModeEnabled = true;

  AppThemeStateNotifier() {
    // Load the theme mode from Hive during initialization
    _loadThemeModeFromHive();
  }

  void setLightTheme() {
    isDarkModeEnabled = false;
    notifyListeners();
    _saveThemeModeToHive();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    notifyListeners();
    _saveThemeModeToHive();
  }

  Future<void> _saveThemeModeToHive() async {
    final box = await Hive.openBox('themeBox');
    await box.put('isDarkModeEnabled', isDarkModeEnabled);
  }

  Future<void> loadThemeModeFromHive() async {
    final box = await Hive.openBox('themeBox');
    isDarkModeEnabled = box.get('isDarkModeEnabled', defaultValue: false);
    notifyListeners();
  }

  Future<void> _loadThemeModeFromHive() async {
    final box = await Hive.openBox('themeBox');
    isDarkModeEnabled = box.get('isDarkModeEnabled') ??
        true; //Default return is true to match the Figma

    notifyListeners();
  }
}
