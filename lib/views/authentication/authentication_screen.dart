import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication/auth_page_controller.dart';
import 'package:frontend/views/authentication/login_screen.dart';
import 'package:frontend/views/authentication/register_screen.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final authPageController = Get.find<AuthPageController>();

  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/NepseTrade_Logo.png"),
                height: size.height * .25,
                width: size.width,
                fit: BoxFit.contain,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          authPageController.selectLoginPage();
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: authPageController.isLoginPage.value
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          onPrimary: authPageController.isLoginPage.value
                              ? Colors.white
                              : Colors.black,
                          minimumSize: Size(100, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        authPageController.selectRegisterPage();
                      },
                      child: Text("Register"),
                      style: ElevatedButton.styleFrom(
                        primary: !authPageController.isLoginPage.value
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        onPrimary: !authPageController.isLoginPage.value
                            ? Colors.white
                            : Colors.black,
                        minimumSize: Size(100, 35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  if (authPageController.isLoginPage.value) {
                    return LoginScreen();
                  } else {
                    return RegisterScreen();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
