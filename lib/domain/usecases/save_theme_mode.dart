import 'package:flutter/material.dart';

abstract class SaveThemeMode {
  Future<void> save(ThemeMode value);
}
