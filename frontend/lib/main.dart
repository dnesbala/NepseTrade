import 'package:flutter/material.dart';
import 'package:frontend/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NepseTrade',
      theme: AppTheme.theme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("NepseTrade"),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return Text("Initial Setup",
                style: Theme.of(context).textTheme.bodyText1);
          }),
        ),
      ),
    );
  }
}
