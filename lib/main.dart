// main.dart
import 'package:flutter/material.dart';
import 'package:test_12/Sceens/Main_Page.dart';

void main() {
  runApp(const Main());
}

/// Main application widget
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
