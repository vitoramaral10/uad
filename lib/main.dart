import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/factories/factories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Universal Android Debloater',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E4266),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E4266),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/settings',
      getPages: [
        GetPage(
          name: '/settings',
          page: () => makeSettingsPage(),
          binding: makeSettingsBinding(),
        ),
      ],
    );
  }
}
