import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/factories/factories.dart';
import 'presentation/presenters/presenters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        GetPage(
          name: '/about',
          page: () => makeAboutPage(),
          binding: makeAboutBinding(),
        ),
      ],
    );
  }
}
