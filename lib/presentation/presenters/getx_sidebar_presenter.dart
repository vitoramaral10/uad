import 'package:get/get.dart';

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
    // TODO: implement this
    // final packageInfo = PackageInfo.fromPlatform();

    // packageInfo.then((value) {
    // _versionApp.value = value.version;
    // });
    _versionApp.value = '1.0.0';
  }
}
