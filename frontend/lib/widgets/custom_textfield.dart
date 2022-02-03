import 'package:flutter/material.dart';
import 'package:frontend/controllers/password_textfield_controller.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final PasswordTextFieldController? passwordTextFieldController;

  const CustomTextField(
      {Key? key, this.isPassword = false, this.passwordTextFieldController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPassword) {
      return Obx(
        () => TextField(
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
        ),
      );
    } else {
      return TextField(
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
      );
    }
  }
}
