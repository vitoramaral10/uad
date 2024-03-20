import '../entities/entities.dart';

abstract class LoadLatestRelease {
  Future<LatestReleaseEntity> run();
}
