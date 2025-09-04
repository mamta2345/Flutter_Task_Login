import 'package:get/get.dart';

class HomeController extends GetxController {
  var users = [
    {"name": "Ali", "mobile": "1234567890"},
    {"name": "Bob", "mobile": "9876543210"},
    {"name": "Charlie", "mobile": "5551234567"},
    {"name": "David", "mobile": "4445556666"},
    {"name": "Mamta", "mobile": "963852741"},
    {"name": "Shalu", "mobile": "852741963"},
    {"name": "Maan", "mobile": "456123789"},
    {"name": "Dixa", "mobile": "789456123"},
    {"name": "Hello", "mobile": "5479931478"},
    {"name": "Aditi", "mobile": "1457895222"},
  ].obs;

  var searchQuery = "".obs;

  List<Map<String, String>> get filteredUsers {
    if (searchQuery.isEmpty) return users;
    return users
        .where(
          (user) =>
              user["name"]!.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
              user["mobile"]!.contains(searchQuery.value),
        )
        .toList();
  }
}
