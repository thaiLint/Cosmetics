import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();
  late Future<List<NotificationModel>> _notifications;

  @override
  void initState() {
    super.initState();
    String token = "your_jwt_token"; // get this from local storage
    _notifications = _notificationService.getNotifications(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<NotificationModel>>(
        future: _notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final notifications = snapshot.data ?? [];

          if (notifications.isEmpty) {
            return const Center(child: Text("No notifications yet."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final n = notifications[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: n.isRead ? Colors.white : Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  leading: const Icon(Icons.notifications_none_rounded,
                      color: Colors.pinkAccent),
                  title: Text(
                    n.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    n.message,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  trailing: n.isRead
                      ? null
                      : const Icon(Icons.circle, color: Colors.pink, size: 10),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
