import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp/core/api_constants.dart';

class ApiService {
  // Send crop input data to the FastAPI backend with 20-second timeout
  Future<double> predictCropYield(Map<String, dynamic> data) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiConstants.PREDICT_URL),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data),
          )
          .timeout(
            const Duration(seconds: 20),
            onTimeout: () {
              throw TimeoutException(
                  "Request to API timed out after 20 seconds");
            },
          );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return decoded["Predicted_Yield"] * 1.0; // ensure double
      } else {
        throw Exception(
            "Server error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }
}
