import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ProfileService {
  final String baseUrl = 'http://10.0.2.2:8000/api';
  String? profileImageUrl;

  // Fetch profile
  Future<Map<String, dynamic>> fetchProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        profileImageUrl = data['user']['profile_image_url'];
        return {"success": true, "user": data['user']};
      } else {
        return {"success": false, "message": "Failed to fetch profile"};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Update profile
  Future<Map<String, dynamic>> updateProfile({
    required String token,
    String? name,
    String? email,
    String? phone,
    String? address,
    File? imageFile,
  }) async {
    try {
      var uri = Uri.parse('$baseUrl/profile/update');
      var request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers['Authorization'] = 'Bearer $token';

      // Add fields
      if (name != null) request.fields['name'] = name;
      if (email != null) request.fields['email'] = email;
      if (phone != null) request.fields['phone'] = phone;
      if (address != null) request.fields['address'] = address;

      // Add image file if exists
      if (imageFile != null) {
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile('image', stream, length,
            filename: basename(imageFile.path));
        request.files.add(multipartFile);
      }

      // Send request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        profileImageUrl = data['user']['profile_image_url'];
        return {"success": true, "user": data['user']};
      } else {
        return {"success": false, "message": responseBody};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
