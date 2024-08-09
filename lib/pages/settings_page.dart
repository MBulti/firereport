import 'package:firereport/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.logout,
              child: const Text("Logout"),
            ),
            const SizedBox(height: 20.0),
            Obx(() => ElevatedButton(
                  onPressed: controller.toggleTheme,
                  child: Text('Erscheinungsbild wechseln ${controller.isDarkMode.value ? ' (Hell)' : ' (Dunkel)'}'),
                )),
          ],
        ),
      ),
    );
  }
}