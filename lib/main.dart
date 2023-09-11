import 'package:flutter/material.dart';
import 'package:shop_application/freatures/freatures_intro/pressentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      title: 'shop app',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
