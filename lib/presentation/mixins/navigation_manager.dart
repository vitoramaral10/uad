import 'package:get/get.dart';

mixin NavigationManager {
  void goBack() {
    Get.back();
  }

  void navigateTo(String route) {
    Get.toNamed(route);
  }

  void navigateToAndRemove(String route) {
    Get.offNamed(route);
  }
}
