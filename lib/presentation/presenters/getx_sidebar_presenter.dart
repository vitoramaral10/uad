import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../ui/components/components.dart';

class GetxSidebarPresenter extends GetxController implements SidebarPresenter {
  final _versionApp = ''.obs;

  @override
  String get versionApp => _versionApp.value;

  @override
  void onInit() {
    super.onInit();

    getVersionApp();
  }

  @override
  void getVersionApp() {
    final packageInfo = PackageInfo.fromPlatform();

    packageInfo.then((value) {
      _versionApp.value = value.version;
    });
  }
}
