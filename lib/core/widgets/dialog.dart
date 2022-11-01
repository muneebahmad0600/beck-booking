import 'package:flutter/material.dart';
import 'package:get/get.dart';

void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(title), content: Text(text),backgroundColor: Colors.pink),
    );

void displaySnackbar(String title, String message) {
  Get.snackbar(title, message,backgroundColor: Colors.pink,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM);
}
