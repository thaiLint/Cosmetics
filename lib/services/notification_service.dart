import 'dart:convert';
import 'package:cosmetics/model/notification_model.dart';
import 'package:http/http.dart' as http;


class NotificationService {
  final String baseUrl = 'http://your-api-url.com/api';

  Future<List<NotificationModel>> getNotifications(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/notifications'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => NotificationModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }
}
