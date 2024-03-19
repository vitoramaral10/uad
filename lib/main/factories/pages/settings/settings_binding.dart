import 'package:get/get.dart';

import '../../../../presentation/presenters/presenters.dart';

Bindings makeSettingsBinding() => _SettingsBinding();

class _SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxSettingsPresenter());
  }
}
