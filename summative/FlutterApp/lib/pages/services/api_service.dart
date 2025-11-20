import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {
  static const String baseUrl = "http://192.168.1.72:8000";

  static Future<double> predict(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/predict");

    // Debug print — only runs in debug mode
    if (kDebugMode) {
      print("Sending request to: $url");
    }

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["Predicted_Yield"];
    } else {
      throw Exception(
        "Server error: ${response.statusCode}, Body: ${response.body}",
      );
    }
  }
}

