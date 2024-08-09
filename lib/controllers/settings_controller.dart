import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = Get.isDarkMode.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  void logout() {
    print("Logout");
  }
}
