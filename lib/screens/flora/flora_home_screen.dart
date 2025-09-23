import 'package:flutter/material.dart';

class FloraHomeScreen extends StatelessWidget {
  const FloraHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.black38),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.account_circle_outlined, color: Colors.black38),
          SizedBox(width: 16),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/flora/flora_logo.png', height: 28, width: 28),
            SizedBox(width: 8),
            Text(
              "FLORA",
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormField(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black38),
                    hintText: "Explore your favorites",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              textAlign: TextAlign.left,
              "All Plants",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView(scrollDirection: Axis.horizontal, children: [Text("data")]),
        ],
      ),
    );
  }
}
