import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Text Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password visibility
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  /// ✅ Validation function
  bool validateRegisterFields() {
    if (nameController.text.isEmpty) {
      showError("Name is required");
      return false;
    }

    if (mobileController.text.isEmpty) {
      showError("Mobile number is required");
      return false;
    }

    if (emailController.text.isEmpty) {
      showError("Email is required");
      return false;
    }

    // ✅ Email validation
    if (!emailController.text.contains("@") ||
        !emailController.text.contains(".")) {
      showError("Enter a valid email address");
      return false;
    }

    if (passwordController.text.isEmpty) {
      showError("Password is required");
      return false;
    }

    // ✅ Password validation
    String password = passwordController.text;

    if (password.length < 10) {
      showError("Password must be at least 10 characters long");
      return false;
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      showError("Password must contain at least one uppercase letter");
      return false;
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      showError("Password must contain at least one number");
      return false;
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      showError("Password must contain at least one special character");
      return false;
    }

    if (confirmPasswordController.text.isEmpty) {
      showError("Confirm Password is required");
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      showError("Passwords do not match");
      return false;
    }

    return true;
  }

  void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}
