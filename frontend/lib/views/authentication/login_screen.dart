import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/controllers/authentication/auth_validation_controller.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final authPageController = Get.find<AuthPageController>();
  final authValidationController = Get.find<AuthValidationController>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: authValidationController.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email"),
            SizedBox(height: 5),
            CustomTextField(
                textEditingController:
                    authValidationController.loginEmailController),
            SizedBox(height: 15),
            Text("Password"),
            SizedBox(height: 5),
            CustomTextField(
              isPassword: true,
              textEditingController:
                  authValidationController.loginPasswordController,
            ),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: authValidationController.login,
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width, 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text("OR")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  label: Text("Facebook"),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text("Google"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "New to NepseTrade? ",
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(
                      text: "Register Now",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = authPageController.selectRegisterPage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
