import 'package:get/get.dart';

import '../../../../presentation/presenters/presenters.dart';

Bindings makeSplashBinding() => _SplashBinding();

class _SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxSplashPresenter(
        // loadThemeMode: makeLocalLoadThemeMode()
        ));
    Get.lazyPut(() => GetxSidebarPresenter());
  }
}
