import 'package:firereport/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void login() async {
    Get.offAll(const DefectReportListPage());
  }

    void guestLogin() async {
    Get.offAll(const DefectReportListPage());
  }
}
