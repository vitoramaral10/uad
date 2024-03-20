import 'assets_entity.dart';

class LatestReleaseEntity {
  final String tagName;
  final List<AssetsEntity> assets;

  LatestReleaseEntity({
    required this.tagName,
    required this.assets,
  });

  factory LatestReleaseEntity.toEmpty() {
    return LatestReleaseEntity(
      tagName: '',
      assets: [],
    );
  }
}
