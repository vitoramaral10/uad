import 'dart:io';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../ui/pages/pages.dart';

class GetxAboutPresenter extends GetxController implements AboutPresenter {
  final DownloadUadList downloadUadList;
  final DownloadUad downloadUad;
  final LoadLatestRelease loadLatestRelease;

  GetxAboutPresenter({
    required this.downloadUadList,
    required this.downloadUad,
    required this.loadLatestRelease,
  });

  final _documentationVersion = ''.obs;
  final _uadVersion = ''.obs;
  final _updateAvailable = false.obs;
  final _latestRelease = LatestReleaseEntity.toEmpty().obs;

  @override
  String get documentationVersion => _documentationVersion.value;
  @override
  String get uadVersion => _uadVersion.value;
  @override
  bool get updateAvailable => _updateAvailable.value;
  @override
  LatestReleaseEntity get latestRelease => _latestRelease.value;

  @override
  void onInit() {
    super.onInit();
    getUadVersion();
    getDocumentationVersion();
    getLatestVersion();
  }

  @override
  Future<void> getUadVersion() async {
    final packageInfo = PackageInfo.fromPlatform();

    _uadVersion.value = (await packageInfo).version;
  }

  @override
  void getDocumentationVersion() {
    _documentationVersion.value = 'v1.0.0';

    final file = File('uad_lists.json');
    if (file.existsSync()) {
      file.lastModified().then((value) {
        String version = 'v${value.year}${value.month}${value.day}';
        _documentationVersion.value = version;
      });
    } else {
      updateDocumentation();
    }
  }

  @override
  Future<void> updateDocumentation() async {
    try {
      final file = await downloadUadList.download();

      final fileUadList = File('${Directory.current.path}/uad_lists.json');

      fileUadList.writeAsString(file);

      getDocumentationVersion();
    } on Exception {
      throw DomainError.unexpected;
    }
  }

  @override
  goToGithubPage() {
    launchUrl(Uri.parse('https://github.com/vitoramaral10/uad'));
  }

  @override
  goToIssuesPage() {
    launchUrl(Uri.parse('https://github.com/vitoramaral10/uad/issues'));
  }

  @override
  goToLogfilesFolder() {
    launchUrlString(Directory.current.path);
  }

  @override
  goToWikiPage() {
    launchUrl(Uri.parse('https://github.com/vitoramaral10/uad/wiki'));
  }

  @override
  Future<void> updateUad() async {
    try {
      final os = Platform.operatingSystem;
      String link = '';

      if (os == 'windows') {
        link = _latestRelease.value.assets
            .firstWhere((element) => element.name == 'uad-windows.zip')
            .browserDownloadUrl;
      } else if (os == 'linux') {
        link = _latestRelease.value.assets
            .firstWhere((element) => element.name == 'uad-linux.zip')
            .browserDownloadUrl;
      } else if (os == 'macos') {
        link = _latestRelease.value.assets
            .firstWhere((element) => element.name == 'uad-macos.zip')
            .browserDownloadUrl;
      } else {
        throw Exception('Unsupported OS');
      }

      launchUrl(Uri.parse(link));
    } on Exception {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<void> getLatestVersion() async {
    try {
      final result = await loadLatestRelease.run();

      _latestRelease.value = result;

      if (result.tagName != _uadVersion.value) {
        _updateAvailable.value = true;
      } else {
        _updateAvailable.value = false;
      }
    } on DomainError {
      throw DomainError.unexpected;
    }
  }
}
