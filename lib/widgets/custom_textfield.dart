import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/utils/helpers.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final authPageController = Get.put<AuthPageController>(AuthPageController());

  final bool isPassword;
  final TextEditingController textEditingController;
  final String? confirmPassword;
  var isPasswordShown = false.obs;

  CustomTextField({
    Key? key,
    this.isPassword = false,
    this.confirmPassword,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPassword) {
      return Obx(
        () => TextFormField(
          controller: textEditingController,
          cursorColor: Colors.grey.shade400,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      togglePasswordVisibility();
                    },
                    icon: isPasswordShown.value
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
          ),
          obscureText: isPasswordShown.value,
          validator: authPageController.isLoginPage.value
              ? _validateLoginPassword
              : _validateRegisterPassword,
        ),
      );
    } else {
      return TextFormField(
        controller: textEditingController,
        cursorColor: Colors.grey.shade400,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        validator: (val) => validateEmail(val),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordShown.value = !isPasswordShown.value;
  }

  String? _validateLoginPassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < 8) {
      return "Password should be atleast 8 characters long";
    } else {
      return null;
    }
  }

  String? _validateRegisterPassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < 8) {
      return "Password should be atleast 8 characters long";
    } else if (password != confirmPassword) {
      return "Both the passwords should match";
    } else {
      return null;
    }
  }
}
