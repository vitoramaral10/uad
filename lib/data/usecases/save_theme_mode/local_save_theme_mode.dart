import 'package:flutter/material.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../cache/cache.dart';

class LocalSaveThemeMode implements SaveThemeMode {
  final CacheStorage localStorage;

  LocalSaveThemeMode({required this.localStorage});

  @override
  Future<void> save(ThemeMode value) async {
    try {
      final themeMode = value == ThemeMode.dark ? 'dark' : 'light';

      await localStorage.save(key: 'theme_mode', value: themeMode);
    } on Exception {
      throw DomainError.unexpected;
    }
  }
}
