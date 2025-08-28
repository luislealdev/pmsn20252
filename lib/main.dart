import 'package:flutter/material.dart';
import 'package:pmsn20252/utils/colors_app.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Flutter App',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Flats',
              fontSize: 30,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 58, 106),
        ),
        body: Container(
          child: Center(
            child: Text(
              "Contador: $contador",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Flats',
                color: ColorsApp.txtColor,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          child: Icon(Icons.ads_click),
        ),
      ),
    );
  }
}
