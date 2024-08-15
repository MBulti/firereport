import 'package:firereport/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsController extends GetxController {
  var isDarkMode = Get.isDarkMode.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

    void logout() {
    Supabase.instance.client.auth.signOut();
    Get.offAll(const LoginPage());
  }
}
