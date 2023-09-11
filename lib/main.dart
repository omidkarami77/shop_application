import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/freatures/freatures_intro/pressentation/bloc/spash_cubit/splash_cubit.dart';
import 'package:shop_application/freatures/freatures_intro/pressentation/screens/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SplashCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shop app',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
