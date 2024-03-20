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
      drawer: const SidebarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Theme', style: Get.theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: const Text('Dark Mode'),
                trailing: Obx(
                  () => Checkbox(
                    value: controller.darkMode,
                    onChanged: (value) => controller.toggleDarkMode(value!),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('General', style: Get.theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                trailing: Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                title: const Text(
                    'Allow to uninstall packages marked as "unsafe" (I KNOW WHAT I AM DOING!)'),
                subtitle: const Text(
                    'Most of unsafe packages are know to bootloop the device if removed.'),
              ),
            ),
            const SizedBox(height: 16),
            Text('Current device', style: Get.theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  Text(
                    'The following settings only affect the currently selected device: ${controller.deviceName} (${controller.deviceId})',
                    style: Get.textTheme.titleMedium!.copyWith(
                      color: Colors.redAccent,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    title: const Text(
                        'Affect all the users of the device (not only the selected user)'),
                    subtitle: const Text(
                        'This will not affect the following protected work profile users:'),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    title: const Text(
                        'Clear and disable packages instead of uninstalling them'),
                    subtitle: const Text(
                        'In some cases, it can be better to disable a package instead of uninstalling it.'),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: FilledButton(
                      onPressed: () {},
                      child: const Text('Backup'),
                    ),
                    title: const Text('Backup the current state of the phone'),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButton(
                          value: '2024-03-18_15-49-54',
                          items: const [
                            DropdownMenuItem(
                              value: '2024-03-18_15-49-54',
                              child: Text('2024-03-18_15-49-54'),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 8),
                        FilledButton(
                          onPressed: () {},
                          child: const Text('Restore'),
                        ),
                      ],
                    ),
                    title: const Text('Restore the state of the device'),
                  ),
                  const Divider(),
                  ListTile(
                    trailing: FilledButton(
                      onPressed: () {},
                      child: const Text('Open backup folder'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
