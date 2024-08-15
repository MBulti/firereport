import 'package:firereport/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    print("LoginController onClose");

    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(const DefectReportListPage());
    } on AuthException catch (e) {
      Get.rawSnackbar(message: e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> guestLogin() async {
    try {
      await Supabase.instance.client.auth.signInAnonymously();
      Get.offAll(const DefectReportListPage());
    } on AuthException catch (e) {
      Get.rawSnackbar(message: e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
