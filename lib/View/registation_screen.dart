import 'package:flutter/material.dart';
import 'package:flutter_task_login/Controller/auth_screen.dart';
import 'package:flutter_task_login/Controller/resgistation_controller.dart';
import 'package:flutter_task_login/custome_input_field.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(RegisterController());
    final authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: const Text(
          "Register Page",
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
              Get.snackbar("Info", "This is Register Page");
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomInputField(
              controller: Controller.nameController,
              label: "Full Name",
              hint: "Enter your name",
              prefixIcon: Icons.person,
            ),

            const SizedBox(height: 12),
            CustomInputField(
              controller: Controller.mobileController,
              label: "Mobile",
              hint: "Enter your mobile number",
              prefixIcon: Icons.phone,
            ),

            const SizedBox(height: 12),
            CustomInputField(
              controller: Controller.emailController,
              label: "Email",
              hint: "Enter your email",
              prefixIcon: Icons.email,
            ),

            const SizedBox(height: 12),
            CustomInputField(
              controller: Controller.passwordController,
              label: "Password",
              hint: "Enter your password",
              prefixIcon: Icons.lock,
              obscureText: Controller.obscurePassword,
              onToggle: Controller.togglePassword,
            ),

            const SizedBox(height: 12),
            CustomInputField(
              controller: Controller.confirmPasswordController,
              label: "Confirm Password",
              hint: "Re-enter your password",
              prefixIcon: Icons.lock_outline,
              obscureText: Controller.obscureConfirmPassword,
              onToggle: Controller.toggleConfirmPassword,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              onPressed: () {
                if (Controller.validateRegisterFields()) {
                  authController.register(
                    Controller.emailController.text,
                    Controller.passwordController.text,
                  );
                }
              },
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
