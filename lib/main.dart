import 'package:flutter/material.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/app_theme.dart';
import 'package:new_project/design_app/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeLight,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}
