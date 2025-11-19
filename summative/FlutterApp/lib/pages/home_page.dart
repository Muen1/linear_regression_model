import 'package:flutter/material.dart';
import 'predict_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crop Prediction Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PredictPage()),
            );
          },
          child: const Text("Go to Prediction Form"),
        ),
      ),
    );
  }
}
