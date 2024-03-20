import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/pages.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  static GetxSplashPresenter get to => Get.find<GetxSplashPresenter>();

  @override
  Future<void> initailize() async {
    await loadCurrentThemeMode();

    Get.offAllNamed('/about');
  }

  @override
  Future<void> loadCurrentThemeMode() async {
    Get.changeThemeMode(ThemeMode.dark);
  }
}
