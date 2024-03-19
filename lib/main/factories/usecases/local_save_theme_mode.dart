import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveThemeMode makeLocalSaveThemeMode() =>
    LocalSaveThemeMode(localStorage: makeLocalStorageAdapter());
