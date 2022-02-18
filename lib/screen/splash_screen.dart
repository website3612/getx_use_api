// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'home part/home_screen.dart';
import 'login_screen (1).dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      if (box.read("isLogin") || box.read("isLogin") == null) {
        Get.to(LogInScreen());
      } else {
        Get.to(HomeScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 300,
              style: FlutterLogoStyle.stacked,
            ),
            SizedBox(height: 20),
            Text(
              "Flutter Api",
              style: TextStyle(fontSize: 30, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
