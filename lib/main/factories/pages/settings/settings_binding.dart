import 'package:get/get.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

Bindings makeSettingsBinding() => _SettingsBinding();

class _SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxSettingsPresenter(
          loadThemeMode: makeLocalLoadThemeMode(),
          saveThemeMode: makeLocalSaveThemeMode(),
        ));
  }
}
