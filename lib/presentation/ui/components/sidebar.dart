import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
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
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  selected: Get.currentRoute == '/about',
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {},
                  selected: Get.currentRoute == '/settings',
                ),
              ],
            ),
          ),
          const Text('Version 1.0.0'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
