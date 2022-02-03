import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthValidationController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController loginEmailController,
      loginPasswordController,
      registerEmailController,
      registerPasswordController,
      registerConfirmPasswordController;
  // var loginEmail = "";
  // var loginPassword = "";
  // var registerEmail = "";
  // var registerPassword = "";
  // var registerConfirmPassword = "";

  @override
  void onInit() {
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    registerEmailController = TextEditingController();
    registerPasswordController = TextEditingController();
    registerConfirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    super.onClose();
  }

  String? validateEmail(String? email) {
    if (!GetUtils.isEmail(email!)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < 8) {
      return "Password should be atleast 8 characters long";
    } else if (registerPasswordController.text !=
        registerConfirmPasswordController.text) {
      return "Both the passwords should match";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? registerConfirmPassword) {
    if (registerPasswordController.text !=
        registerConfirmPasswordController.text) {
      return "Both the passwords should match";
    } else {
      return null;
    }
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      print("Login successful");
    }
  }

  register() {
    if (registerFormKey.currentState!.validate()) {
      // Get.to(AuthenticationScreen());
    }
  }
}
