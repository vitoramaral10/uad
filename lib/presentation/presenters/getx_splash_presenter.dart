import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../ui/pages/pages.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  LoadThemeMode loadThemeMode;

  static GetxSplashPresenter get to => Get.find<GetxSplashPresenter>();

  GetxSplashPresenter({required this.loadThemeMode});

  @override
  Future<void> initailize() async {
    await loadCurrentThemeMode();

    Get.offAllNamed('/settings');
  }

  @override
  Future<void> loadCurrentThemeMode() async {
    final themeMode = await loadThemeMode.load();

    Get.changeThemeMode(themeMode);
  }
}
