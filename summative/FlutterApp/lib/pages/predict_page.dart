import 'package:flutter/material.dart';
import 'services/api_service.dart'; 
class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  final formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> controllers = {
    "Rainfall_mm": TextEditingController(),
    "Temperature_Celsius": TextEditingController(),
    "Fertilizer_Used": TextEditingController(),
    "Irrigation_Used": TextEditingController(),
    "Days_to_Harvest": TextEditingController(),
    "Region_North": TextEditingController(),
    "Region_South": TextEditingController(),
    "Region_West": TextEditingController(),
    "Soil_Type_Clay": TextEditingController(),
    "Soil_Type_Loam": TextEditingController(),
    "Soil_Type_Peaty": TextEditingController(),
    "Soil_Type_Sandy": TextEditingController(),
    "Soil_Type_Silt": TextEditingController(),
    "Crop_Cotton": TextEditingController(),
    "Crop_Maize": TextEditingController(),
    "Crop_Rice": TextEditingController(),
    "Crop_Soybean": TextEditingController(),
    "Crop_Wheat": TextEditingController(),
    "Weather_Condition_Rainy": TextEditingController(),
    "Weather_Condition_Sunny": TextEditingController(),
  };

  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Predict Crop Yield")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        "Enter Crop Inputs",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      ...controllers.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            controller: entry.value,
                            decoration: InputDecoration(
                              labelText: entry.key,
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        );
                      }),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () async {
                          final data = {
                            for (var entry in controllers.entries)
                              entry.key:
                                  double.tryParse(entry.value.text) ?? 0
                          };

                          try {
                            final resultValue =
                                await ApiService.predict(data);

                            setState(() {
                              result = "Predicted Yield: $resultValue";
                            });
                          } catch (e) {
                            setState(() {
                              result = "Error: $e";
                            });
                          }
                        },
                        child: const Text("Predict"),
                      ),

                      const SizedBox(height: 20),

                      if (result != null)
                        Text(
                          result!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
