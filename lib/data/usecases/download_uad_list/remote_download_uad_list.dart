import 'dart:convert';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';

class RemoteDownloadUadList implements DownloadUadList {
  final HttpClient httpClient;
  final String url;

  RemoteDownloadUadList({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<String> download() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');

      return jsonEncode(httpResponse);
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
