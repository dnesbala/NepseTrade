import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? validateEmail(String? email) {
  if (!GetUtils.isEmail(email!)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

showErrorSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showSuccessSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showSnackbar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
  );
}
