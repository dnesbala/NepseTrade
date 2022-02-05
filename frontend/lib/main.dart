import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/config/app_routes.dart';
import 'package:frontend/config/app_theme.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppTheme.theme().colorScheme.primary,
  ));
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
      initialRoute: "/home",
      getPages: AppRoutes.pages,
    );
  }
}
