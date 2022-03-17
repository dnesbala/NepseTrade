import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/controllers/authentication/auth_validation_controller.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final authValidationController =
      Get.put<AuthValidationController>(AuthValidationController());
  final authPageController = Get.put<AuthPageController>(AuthPageController());

  final bool isPassword;
  final TextEditingController textEditingController;
  var isPasswordShown = false.obs;

  CustomTextField({
    Key? key,
    this.isPassword = false,
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
                ? authValidationController.validateLoginPassword
                : authValidationController.validateRegisterPassword),
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
        validator: authValidationController.validateEmail,
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordShown.value = !isPasswordShown.value;
  }
}
