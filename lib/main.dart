import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/config/app_links.dart';
import 'package:frontend/config/app_routes.dart';
import 'package:frontend/config/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "nepse-trade",
    options: FirebaseOptions(
      apiKey: "AIzaSyCLdtb38lLI3Ezeck3By4UCnBZ-85Nm-Aw",
      projectId: "nepse-trade",
      appId: "1:882166498821:android:b0e61c910918f282d2be6c",
      messagingSenderId: "882166498821",
      authDomain: "nepse-trade.firebaseapp.com",
      storageBucket: "nepse-trade.appspot.com",
      measurementId: "G-Q923NBEKMF",
    ),
  );
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
      initialRoute: AppLinks.AUTH,
      getPages: AppRoutes.pages,
    );
  }
}
