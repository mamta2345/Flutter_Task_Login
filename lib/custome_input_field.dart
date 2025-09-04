import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final RxBool? obscureText; // 👈 yaha RxBool dena hoga agar eye icon chahiye
  final VoidCallback? onToggle;

  CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.prefixIcon,

    this.obscureText,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon, color: Colors.purple),
        suffixIcon: obscureText != null
            ? IconButton(
                icon: Icon(
                  obscureText!.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: onToggle,
              )
            : null,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
    );
  }
}
