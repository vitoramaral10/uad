import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';

class GetxSettingsPresenter extends GetxController
    implements SettingsPresenter {
  final _darkMode = false.obs;
  final _deviceName = ''.obs;
  final _deviceId = ''.obs;

  @override
  bool get darkMode => _darkMode.value;
  @override
  String get deviceName => _deviceName.value;
  @override
  String get deviceId => _deviceId.value;

  @override
  void onInit() {
    super.onInit();

    loadCurrentThemeMode();
  }

  @override
  Future<void> loadCurrentThemeMode() async {
    _darkMode.value = true;
  }

  @override
  void toggleDarkMode(bool value) {
    try {
      ThemeMode themeMode = value ? ThemeMode.dark : ThemeMode.light;

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
