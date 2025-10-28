
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json", // Important for Laravel
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        final token = data['token'] ?? data['access_token'];
        if (token != null) {
          await saveToken(token);
        }

        return {
          "success": true,
          "message": data['message'] ?? "Login successful",
          "token": token,
        };
      } else if (response.statusCode == 401) {
        // Laravel returns 401 for invalid credentials
        final data = jsonDecode(response.body);
        return {
          "success": false,
          "message": data['error'] ?? "Invalid email or password",
        };
      } else {
        // Other unexpected errors
        final data = jsonDecode(response.body);
        return {
          "success": false,
          "message": data['message'] ?? "Something went wrong",
        };
      }
    } catch (e) {
      print("❌ Exception: $e");
      return {
        "success": false,
        "message": "Connection error: $e",
      };
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }
}
