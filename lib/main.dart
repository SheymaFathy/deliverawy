import 'package:deliverawy/view/auth/login.dart';
import 'package:deliverawy/view/screens/welcome%20screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/colors.dart';
late SharedPreferences saveddata;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)

      ),
      home: StartPage()
    );
  }
}
