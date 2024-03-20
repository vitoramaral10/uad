import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteLoadLatestRelease implements LoadLatestRelease {
  final HttpClient httpClient;
  final String url;

  RemoteLoadLatestRelease({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<LatestReleaseEntity> run() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');

      return LatestReleaseModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      switch (error) {
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
