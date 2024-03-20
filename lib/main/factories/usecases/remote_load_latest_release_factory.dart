import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

LoadLatestRelease makeRemoteLoadLatestRelease() => RemoteLoadLatestRelease(
      httpClient: makeHttpAdapter(),
      url: 'https://api.github.com/repos/vitoramaral10/uad/releases/latest',
    );
