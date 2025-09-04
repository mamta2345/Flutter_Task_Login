import 'package:get/get.dart';

class AuthController extends GetxController {
  var registeredEmail = "".obs;
  var registeredPassword = "".obs;

  void register(String email, String password) {
    registeredEmail.value = email;
    registeredPassword.value = password;
    Get.offAllNamed('/login');
  }

  void login(String email, String password) {
    if (email == registeredEmail.value &&
        password == registeredPassword.value) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        "Error",
        "Invalid credentials",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
