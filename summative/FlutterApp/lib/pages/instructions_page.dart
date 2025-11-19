import 'package:flutter/material.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text("App Instructions"),
      ),
      backgroundColor: const Color(0xfff1f8e9),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [

            Text(
              "How to Use the App",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "1 Go to the 'Predict Yield' page.\n"
              "- Enter soil type\n"
              "- Enter rainfall\n"
              "- Temperature\n"
              "- Fertilizer used\n"
              "- Irrigation used\n"
              "- Days to harvest\n\n",

              style: TextStyle(fontSize: 16),
            ),

            Text(
              "2 Click the Predict button. "
              "The app sends your values to the machine learning model API.",

              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            Text(
              "3 The API responds with the predicted crop yield in tons per hectare.",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            Text(
              "4 View the prediction and adjust inputs to see how they affect yield.",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 40),

            Text(
              "Tips",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),

            SizedBox(height: 10),
            Text(
              "✔ Ensure numbers are realistic\n"
              "✔ Temperature in °C\n"
              "✔ Rainfall in mm\n"
              "✔ Use positive values only\n",

              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
