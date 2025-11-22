import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp/core/constants/api_constants.dart';

class ApiService {
  Future<double> predictCropYield(Map<String, dynamic> data) async {
    try {
      // Debug print to verify the URL used
      // ignore: avoid_print
      print("🔥 DEBUG — Using API URL: ${ApiConstants.predictUrl}");

      final response = await http
          .post(
            Uri.parse(ApiConstants.predictUrl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data),
          )
          .timeout(
            const Duration(seconds: 120),
            onTimeout: () {
              throw TimeoutException(
                "Request to API timed out after 120 seconds",
              );
            },
          );

      // Debug response details
      // ignore: avoid_print
      print("🔥 DEBUG — Response status: ${response.statusCode}");
      // ignore: avoid_print
      print("🔥 DEBUG — Response body: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return decoded["Predicted_Yield"] * 1.0; 
      } else {
        throw Exception(
          "Server error ${response.statusCode}: ${response.body}",
        );
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }
}
