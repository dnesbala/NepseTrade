import 'package:flutter/material.dart';
import 'package:frontend/controllers/authentication/auth_controller.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          AuthController.instance.logOut();
        },
        child: Text("Log Out"),
      ),
    );
  }
}
