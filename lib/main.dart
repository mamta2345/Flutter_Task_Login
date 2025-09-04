import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_login/View/splace_screen.dart';
import 'package:flutter_task_login/route.dart';
import 'package:get/get.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (contexr) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task Login',

      initialRoute: '/',
      getPages: appRoutes,
      home: const SplashScreen(),
    );
  }
}
