import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/config/app_theme.dart';
import 'package:frontend/views/authentication/authentication_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
    );
  }
}
