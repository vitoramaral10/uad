import '../../domain/entities/entities.dart';
import 'models.dart';

class LatestReleaseModel {
  String tagName;
  List<AssetsModel> assets;

  LatestReleaseModel({
    required this.tagName,
    required this.assets,
  });

  factory LatestReleaseModel.fromJson(Map<String, dynamic> json) {
    return LatestReleaseModel(
      tagName: json['tag_name'],
      assets:
          (json['assets'] as List).map((e) => AssetsModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tag_name': tagName,
    };
  }

  LatestReleaseEntity toEntity() => LatestReleaseEntity(
      tagName: tagName, assets: assets.map((e) => e.toEntity()).toList());
}
