import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  // ⚠️ Update this depending on your setup:
  // Android Emulator → http://10.0.2.2:8000/api
  // iOS Simulator → http://127.0.0.1:8000/api
  // Real Device → http://your-computer-ip:8000/api
  final String baseUrl = 'http://10.0.2.2:8000/api';

  // 🔹 Login user function
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];

        // Save token
        await saveToken(token);

        return {
          "success": true,
          "message": "Login successful",
          "token": token,
        };
      } else {
        final data = jsonDecode(response.body);
        return {
          "success": false,
          "message": data['message'] ?? "Invalid email or password",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Error: $e",
      };
    }
  }

  // 🔹 Save JWT token locally
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }
}
