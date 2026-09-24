import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),
      home: const HomeScreen(),
    );
  }
}
