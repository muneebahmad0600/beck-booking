import 'dart:async';

import 'package:beck_booking/core/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed('/login');
    });
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Beck Booking",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
