import 'package:flutter/material.dart';
import 'package:pmsn20252/screens/flora/flora_home_screen.dart';
import 'package:pmsn20252/screens/flora/plant_screen.dart';
import 'package:pmsn20252/screens/flora/account_screen.dart';
import 'package:pmsn20252/screens/flora/cart_screen.dart';
import 'package:pmsn20252/screens/home_screen.dart';
import 'package:pmsn20252/screens/iot_device_details_screen.dart';
import 'package:pmsn20252/screens/movies/add_movie_screen.dart';
import 'package:pmsn20252/screens/login_screen.dart';
import 'package:pmsn20252/screens/register_screen.dart';
import 'package:pmsn20252/utils/theme_app.dart';
import 'package:pmsn20252/utils/value_listener.dart';

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
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, value, _) {
        return MaterialApp(
          theme: value ? ThemeApp.darkTheme() : ThemeApp.lightTheme(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/register': (context) => const RegisterScreen(),
          '/flora': (context) => FloraHomeScreen(),
          '/account': (context) => const AccountScreen(),
          '/cart': (context) => const CartScreen(),
          "/add": (context) => const AddMovieScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        );
      },
    );
  }
}
