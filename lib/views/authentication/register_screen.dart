import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/controllers/authentication/auth_controller.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authPageController = Get.find<AuthPageController>();

  final _registerKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: _registerKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email"),
            SizedBox(height: 5),
            CustomTextField(
              textEditingController: _emailController,
            ),
            SizedBox(height: 15),
            Text("Password"),
            SizedBox(height: 5),
            CustomTextField(
              isPassword: true,
              textEditingController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            SizedBox(height: 15),
            Text("Confirm Password"),
            SizedBox(height: 5),
            CustomTextField(
              isPassword: true,
              textEditingController: _confirmPasswordController,
              confirmPasswordController: _passwordController,
            ),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_registerKey.currentState!.validate()) {
                    AuthController.instance.registerWithEmailPassword(
                        _emailController.text, _passwordController.text);
                  }
                },
                child: Text("Register"),
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
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(
                      text: "Login",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = authPageController.selectLoginPage,
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
