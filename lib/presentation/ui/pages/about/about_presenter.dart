import 'package:uad/domain/entities/entities.dart';

abstract class AboutPresenter {
  String get documentationVersion;
  String get uadVersion;
  bool get updateAvailable;
  LatestReleaseEntity get latestRelease;

  Future<void> getUadVersion();
  Future<void> getLatestVersion();
  void getDocumentationVersion();
  Future<void> updateDocumentation();
  Future<void> updateUad();

  void goToGithubPage();
  void goToWikiPage();
  void goToIssuesPage();
  void goToLogfilesFolder();
}
