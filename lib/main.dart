import 'dart:io' as IO;

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_use_api/screen/home%20part/home_screen.dart';
import 'package:getx_use_api/screen/home%20part/personal_screen.dart';
import 'package:getx_use_api/screen/login_screen%20(1).dart';
import 'package:getx_use_api/screen/splash_screen.dart';

class MyHttpOverrides extends IO.HttpOverrides {
  @override
  IO.HttpClient createHttpClient(IO.SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (IO.X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  IO.HttpOverrides.global = new MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
