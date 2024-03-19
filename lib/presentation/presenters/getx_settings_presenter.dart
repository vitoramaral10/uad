import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';

class GetxSettingsPresenter extends GetxController
    implements SettingsPresenter {
  final _darkMode = false.obs;

  @override
  bool get darkMode => _darkMode.value;

  @override
  void onInit() {
    super.onInit();
    _darkMode.value = Get.isDarkMode;
  }

  @override
  void toggleDarkMode(bool value) {
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    _darkMode.value = value;
  }
}
