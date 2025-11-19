import 'package:flutter/material.dart';
import 'package:flutterapp/pages/predict_page.dart';
import 'package:flutterapp/pages/instructions_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8f5e9), // soft green background
      appBar: AppBar(
        backgroundColor: const Color(0xff4caf50),
        title: const Text(
          "Crop Yield Predictor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Welcome Farmer 👩‍🌾",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Use this app to estimate crop yields and learn how to use the app.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            // Predict Yield Card
            _buildCard(
              title: "Predict Yield",
              icon: Icons.agriculture_rounded,
              color: Colors.green.shade600,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PredictPage()),
                );
              },
            ),

            const SizedBox(height: 20),

            // Instructions Card
            _buildCard(
              title: "App Instructions",
              icon: Icons.menu_book_rounded,
              color: Colors.brown.shade500,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InstructionsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.green.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              // ignore: deprecated_member_use
              backgroundColor: color.withOpacity(0.8),
              child: Icon(icon, size: 30, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
