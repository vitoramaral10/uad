import 'package:flutter/material.dart';

import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

class LocalLoadThemeMode implements LoadThemeMode {
  final CacheStorage localStorage;

  LocalLoadThemeMode({required this.localStorage});

  @override
  Future<ThemeMode> load() async {
    return await localStorage.fetch('theme_mode').then((value) {
      if (value == 'light') {
        return ThemeMode.light;
      } else if (value == 'dark') {
        return ThemeMode.dark;
      } else {
        return ThemeMode.dark;
      }
    }, onError: (error) {
      return ThemeMode.dark;
    });
  }
}
