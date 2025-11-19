import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/predict_page.dart';
import 'pages/instructions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crop Yield Predictor",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xffe8f5e9),
        useMaterial3: false,
      ),

      // Initial Page
      home: const HomePage(),

      // Named Routes (optional but useful)
      routes: {
        '/home': (context) => const HomePage(),
        '/predict': (context) => const PredictPage(),
        '/instructions': (context) => const InstructionsPage(),
      },
    );
  }
}
