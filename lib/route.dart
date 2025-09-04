import 'package:flutter_task_login/View/home_screen.dart';
import 'package:flutter_task_login/View/login_screen.dart';
import 'package:flutter_task_login/View/registation_screen.dart';
import 'package:flutter_task_login/View/splace_screen.dart';
import 'package:get/get.dart';

final appRoutes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/register', page: () => RegisterScreen()),
  GetPage(name: '/login', page: () => const LoginScreen()),
  GetPage(name: '/home', page: () => const HomeScreen()),
];
