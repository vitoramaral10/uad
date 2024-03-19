import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';

class GetxSettingsPresenter extends GetxController
    implements SettingsPresenter {
  // LoadThemeMode loadThemeMode;
  // SaveThemeMode saveThemeMode;

  final _darkMode = false.obs;

  @override
  bool get darkMode => _darkMode.value;

  GetxSettingsPresenter(
      //   {
      //   required this.loadThemeMode,
      //   required this.saveThemeMode,
      // }
      );

  @override
  void onInit() {
    super.onInit();

    loadCurrentThemeMode();
  }

  @override
  void loadCurrentThemeMode() {
    // final themeMode = await loadThemeMode.load();
    // _darkMode.value = themeMode == ThemeMode.dark;
    _darkMode.value = true;
  }

  @override
  void toggleDarkMode(bool value) {
    try {
      ThemeMode themeMode = value ? ThemeMode.dark : ThemeMode.light;
      // saveThemeMode.save(themeMode);
      Get.changeThemeMode(themeMode);
      _darkMode.value = value;
    } on Exception {
      Get.snackbar(
        'Error',
        'Error saving theme mode. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
