import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

DownloadUadList makeRemoteDownloadUadList() => RemoteDownloadUadList(
      httpClient: makeHttpAdapter(),
      url:
          'https://raw.githubusercontent.com/vitoramaral10/uad/master/assets/uad_list.json',
    );
