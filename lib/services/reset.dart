import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/reset-password'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
  "email": email,
  "token": code, // API expects 'token' field
  "password": password,
  "password_confirmation": passwordConfirmation,
}),

      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      Map<String, dynamic> body;
      try {
        body = jsonDecode(response.body);
      } catch (_) {
        return {"error": "Invalid response: ${response.body}"};
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"message": body['message'] ?? "Password reset successfully"};
      } else if (body['errors'] != null) {
        String errors = body['errors'].values.expand((e) => e).join(' ');
        return {"error": errors};
      } else {
        return {"error": body['message'] ?? "Failed to reset password"};
      }
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
