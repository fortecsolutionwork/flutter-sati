// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      check();
    });
  }

  void check() async {
    var token = await box.read("token");
    var exist = await box.read("logedin");

    if (token != null && exist == "yes") {
      Get.offAndToNamed('/home');
    } else {
      Get.offAndToNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        child: Stack(
          children: [
            Image.asset(
              "assets/img/splash.png",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Image.asset(
                'assets/img/logo.png',
                height: width * .4,
                width: width * .4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
