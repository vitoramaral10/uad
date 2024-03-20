import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../mixins/mixins.dart';
import '../../../presenters/presenters.dart';

class SidebarWidget extends GetView<GetxSidebarPresenter>
    with NavigationManager {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF5E4266),
                  ),
                  child: Text('Universal Android Debloater'),
                ),
                ListTile(
                  leading: const Icon(Icons.apps),
                  title: const Text('Apps'),
                  selected: Get.currentRoute == '/apps',
                  onTap: () => navigateToAndRemove('/apps'),
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  selected: Get.currentRoute == '/about',
                  onTap: () => navigateToAndRemove('/about'),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () => navigateToAndRemove('/settings'),
                  selected: Get.currentRoute == '/settings',
                ),
              ],
            ),
          ),
          Obx(() => Text('Version ${controller.versionApp}')),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
