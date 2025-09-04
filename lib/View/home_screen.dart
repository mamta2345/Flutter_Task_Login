import 'package:flutter/material.dart';
import 'package:flutter_task_login/Controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: const Text(
          "Home Page",
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
              Get.snackbar("Info", "This is Home Page");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search by name or mobile",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
              ),
              onChanged: (value) => homeController.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              final filteredUsers = homeController.filteredUsers;
              if (filteredUsers.isEmpty) {
                return const Center(child: Text("No users found"));
              }
              return ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(user["name"]![0])),
                    title: Text(user["name"]!),
                    subtitle: Text(user["mobile"]!),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
