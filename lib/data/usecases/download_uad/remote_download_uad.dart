import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';

class RemoteDownloadUad implements DownloadUad {
  final HttpClient httpClient;

  RemoteDownloadUad({
    required this.httpClient,
  });

  @override
  Future<void> download(String link, String path) async {
    try {
      final httpResponse = await httpClient.request(
        url: link,
        method: 'download',
        fileName: path,
      );

      return httpResponse;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
