import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/controllers/authentication/auth_validation_controller.dart';
import 'package:frontend/controllers/password_textfield_controller.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final authValidationController =
      Get.put<AuthValidationController>(AuthValidationController());
  final authPageController = Get.put<AuthPageController>(AuthPageController());

  final String tag;
  final bool isPassword;
  final TextEditingController textEditingController;
  final PasswordTextFieldController? passwordTextFieldController;

  CustomTextField(
      {Key? key,
      this.tag = "",
      this.isPassword = false,
      required this.textEditingController,
      this.passwordTextFieldController})
      : super(key: key);

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
                        passwordTextFieldController?.toggle();
                      },
                      icon: passwordTextFieldController!.isPasswordShown.value
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )
                  : null,
            ),
            obscureText: !passwordTextFieldController!.isPasswordShown.value,
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
}
