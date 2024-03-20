import 'package:get/get.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

Bindings makeAboutBinding() => _AboutBinding();

class _AboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxAboutPresenter(
          downloadUadList: makeRemoteDownloadUadList(),
          downloadUad: makeRemoteDownloadUad(),
          loadLatestRelease: makeRemoteLoadLatestRelease(),
        ));
  }
}
