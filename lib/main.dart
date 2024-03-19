import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uad/presentation/presenters/presenters.dart';

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
      themeMode: ThemeMode.system,
      initialBinding: makeSplashBinding(),
      onInit: () {
        GetxSplashPresenter.to.initailize();
      },
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
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => makeSplashPage(),
          binding: makeSplashBinding(),
        ),
        GetPage(
          name: '/settings',
          page: () => makeSettingsPage(),
          binding: makeSettingsBinding(),
        ),
      ],
    );
  }
}
