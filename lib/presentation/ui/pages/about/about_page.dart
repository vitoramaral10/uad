import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presenters/presenters.dart';
import '../../components/components.dart';

class AboutPage extends GetView<GetxAboutPresenter> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      drawer: const SidebarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                    'Universal Android Debloater (UAD) is a Free and Open-Source community project aiming at simplifying the removal of pre-installed apps on any Android device.'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                              'Documentation: ${controller.documentationVersion}'),
                        ),
                        const SizedBox(height: 40),
                        Obx(() =>
                            Text('UAD version: ${controller.uadVersion}')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        OutlinedButton(
                          onPressed: controller.updateDocumentation,
                          child: const Text('Update'),
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => OutlinedButton(
                            onPressed: controller.updateAvailable
                                ? controller.updateUad
                                : null,
                            child: const Text('Update'),
                          ),
                        ),
                        Obx(() {
                          if (!controller.updateAvailable) {
                            return const Text('(No update available)');
                          } else {
                            return Container();
                          }
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: controller.goToGithubPage,
                  child: const Text('Github page'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: controller.goToWikiPage,
                  child: const Text('Wiki'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: controller.goToIssuesPage,
                  child: const Text('Have an issue?'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: controller.goToLogfilesFolder,
                  child: const Text('Locate the logfiles'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
