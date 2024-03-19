import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/presenters.dart';
import '../../components/components.dart';

class SettingsPage extends GetView<GetxSettingsPresenter> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: const Text('Dark Mode'),
                trailing: Obx(
                  () => Switch(
                    value: controller.darkMode,
                    onChanged: controller.toggleDarkMode,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
