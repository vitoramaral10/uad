import 'package:uad/domain/usecases/load_theme_mode.dart';

import '../../../data/usecases/usecases.dart';
import '../factories.dart';

LoadThemeMode makeLocalLoadThemeMode() =>
    LocalLoadThemeMode(localStorage: makeLocalStorageAdapter());
