import 'package:firereport/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Passwort",
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: controller.login,
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: controller.guestLogin,
              child: const Text("Gast Login"),
            ),
          ],
        ),
      ),
    );
  }
}
