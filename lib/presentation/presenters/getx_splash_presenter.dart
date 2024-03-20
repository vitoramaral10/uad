import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  // LoadThemeMode loadThemeMode;

  static GetxSplashPresenter get to => Get.find<GetxSplashPresenter>();

  GetxSplashPresenter(
      // {required this.loadThemeMode}
      );

  @override
  Future<void> initailize() async {
    await loadCurrentThemeMode();

    Get.offAllNamed('/about');
  }

  @override
  Future<void> loadCurrentThemeMode() async {
    // final themeMode = await loadThemeMode.load();
    // Get.changeThemeMode(themeMode);
    Get.changeThemeMode(ThemeMode.dark);
  }
}
