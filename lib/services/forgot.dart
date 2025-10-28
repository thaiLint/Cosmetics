import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  /// Request 6-digit code
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final url = Uri.parse('$baseUrl/forgot-password');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"email": email}),
      );

      final data = jsonDecode(response.body);

      // If API returns code, include it
      if (response.statusCode == 200 && data.containsKey('code')) {
        return {"code": data['code']};
      } else {
        return {"error": data['message'] ?? "Failed to send code"};
      }
    } catch (e) {
      return {"error": e.toString()};
    }
  }

  /// Reset password using code
  // Future<Map<String, dynamic>> resetPassword({
  //   required String email,
  //   required String code,
  //   required String password,
  //   required String passwordConfirmation,
  // }) async {
  //   final url = Uri.parse('$baseUrl/reset-password');

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //       },
  //       body: jsonEncode({
  //         "email": email,
  //         "code": code,
  //         "password": password,
  //         "password_confirmation": passwordConfirmation, // API expects snake_case
  //       }),
  //     );

  //     final data = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       return {"message": data['message'] ?? "Password reset successful"};
  //     } else {
  //       return {"error": data['message'] ?? "Failed to reset password"};
  //     }
  //   } catch (e) {
  //     return {"error": e.toString()};
  //   }
  // }
  Future<Map<String, dynamic>> resetPassword({
  required String email,
  required String code, // 6-digit code
  required String password,
  required String passwordConfirmation,
}) async {
  final url = Uri.parse('$baseUrl/reset-password');

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "Accept": "application/json"},
      body: jsonEncode({
        "email": email,
        "code": code, // send code instead of token
        "password": password,
        "password_confirmation": passwordConfirmation,
      }),
    );

    final data = jsonDecode(response.body);
    return data;
  } catch (e) {
    return {"error": e.toString()};
  }
}

}
