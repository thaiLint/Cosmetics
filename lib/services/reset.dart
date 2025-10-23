import 'dart:convert';
import 'package:http/http.dart' as http;

class ResetService {
  final String baseUrl = 'http://10.0.2.2:8000/api'; // replace with your Laravel API URL

  // Reset password method
  Future<Map<String, dynamic>> resetPassword(
      String email, String token, String password, String passwordConfirmation) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/reset-password"),
        headers: {
          "Content-Type": "application/json",
          // Add authorization if needed
        },
        body: jsonEncode({
          "email": email,
          "token": token,
          "password": password,
          "password_confirmation": passwordConfirmation,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {
          "error": jsonDecode(response.body)['error'] ??
              "Failed to reset password. Status: ${response.statusCode}"
        };
      }
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
