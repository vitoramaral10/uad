import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Dio client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
    String? fileName,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? jsonEncode(body) : null;
    Response response = Response(
      data: '',
      statusCode: 500,
      requestOptions: RequestOptions(path: ''),
    );
    Future<Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse = client.post(url,
            data: jsonBody, options: Options(headers: defaultHeaders));
      } else if (method == 'get') {
        futureResponse =
            client.get(url, options: Options(headers: defaultHeaders));
      } else if (method == 'put') {
        futureResponse = client.put(url,
            data: jsonBody, options: Options(headers: defaultHeaders));
      } else if (method == 'download') {
        futureResponse = client.download(url, fileName);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        if (response.data.runtimeType == ResponseBody) {
          return null;
        } else {
          return response.data.isEmpty ? null : response.data;
        }
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
