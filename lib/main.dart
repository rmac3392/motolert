import 'package:flutter/material.dart';
import 'package:motolert/landingPage.dart';
import 'package:motolert/loginPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      );
  }
}
