import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/presenters.dart';

class SplashPage extends GetView<GetxSplashPresenter> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 16),
            Center(
              child: Text('Loading...'),
            ),
          ],
        ),
      ),
    );
  }
}
