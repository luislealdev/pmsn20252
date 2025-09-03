import 'package:flutter/material.dart';
import 'package:pmsn20252/screens/home_screen.dart';
// import 'package:pmsn20252/screens/home_screen.dart';
import 'package:pmsn20252/screens/login_screen.dart';
// import 'package:pmsn20252/utils/colors_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
