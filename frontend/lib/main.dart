import 'package:flutter/material.dart';
import 'package:frontend/config/app_routes.dart';
import 'package:frontend/config/app_theme.dart';
import 'package:frontend/views/authentication/authentication_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NepseTrade',
      theme: AppTheme.theme(),
      home: AuthenticationScreen(),
      getPages: AppRoutes.pages,
    );
  }
}
