import '../../domain/entities/entities.dart';

class AssetsModel {
  String name;
  String browserDownloadUrl;

  AssetsModel({
    required this.name,
    required this.browserDownloadUrl,
  });

  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    return AssetsModel(
      name: json['name'],
      browserDownloadUrl: json['browser_download_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'browser_download_url': browserDownloadUrl,
    };
  }

  AssetsEntity toEntity() => AssetsEntity(
        name: name,
        browserDownloadUrl: browserDownloadUrl,
      );
}
