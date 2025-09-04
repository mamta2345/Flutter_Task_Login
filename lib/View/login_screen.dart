// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_task_login/Controller/auth_screen.dart';
import 'package:flutter_task_login/Controller/resgistation_controller.dart';
import 'package:flutter_task_login/custome_input_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final Controller = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: const Text(
          "Login Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              Get.snackbar("Info", "This is Login Page");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomInputField(
              controller: Controller.emailController,
              label: "Email",
              hint: "Enter your email",
              prefixIcon: Icons.person,
            ),

            const SizedBox(height: 12),
            CustomInputField(
              controller: Controller.passwordController,
              label: "Password",
              hint: "Enter the password",
              prefixIcon: Icons.lock,
              obscureText: Controller.obscurePassword,
              onToggle: Controller.togglePassword,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // ✅ full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              onPressed: () {
                authController.login(
                  Controller.emailController.text,
                  Controller.passwordController.text,
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
