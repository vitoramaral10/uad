import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../http/http.dart';

DownloadUad makeRemoteDownloadUad() =>
    RemoteDownloadUad(httpClient: makeHttpAdapter());
