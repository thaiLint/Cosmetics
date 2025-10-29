import 'dart:io';
import 'package:cosmetics/views/logout.dart';
import 'package:cosmetics/views/updatepassword_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Condition;
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_detail.dart';
import 'help_center.dart';
import 'language.dart';

import 'condition.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  File? _imageFile;
  String _userName = 'User Name';
  String _userEmail = 'user@example.com';
  int _selectedMenuIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadProfileFromPrefs();
  }

  Future<void> _loadProfileFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('user_name') ?? 'User Name';
      _userEmail = prefs.getString('user_email') ?? 'user@example.com';
      final path = prefs.getString('local_profile_image');
      if (path != null && File(path).existsSync()) _imageFile = File(path);
    });
  }

  Future<void> _editProfile() async {
    final updated = await Get.to<Map<String, dynamic>>(() => const ProfileDetail());
    if (updated != null) {
      setState(() {
        _userName = updated['name'] ?? _userName;
        _userEmail = updated['email'] ?? _userEmail;

        final path = updated['profile_image_path'];
        if (path != null && File(path).existsSync()) {
          _imageFile = File(path);
        }
      });
    }
  }

  Widget _buildProfileAvatar() {
    if (_imageFile != null && _imageFile!.existsSync()) {
      return CircleAvatar(
        key: UniqueKey(),
        radius: 35,
        backgroundImage: FileImage(_imageFile!),
      );
    } else {
      return const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white, size: 40),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Profile Setting",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _editProfile,
                child: Row(
                  children: [
                    _buildProfileAvatar(),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_userName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(_userEmail, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ActionIcon(icon: Icons.shopping_bag, label: "My Order", color: Colors.pinkAccent),
                    ActionIcon(icon: Icons.favorite, label: "Wishlist", color: Colors.redAccent),
                    ActionIcon(icon: Icons.shopping_cart, label: "Cart", color: Colors.amber),
                    ActionIcon(icon: Icons.quiz, label: "Skin Quiz", color: Colors.orangeAccent),
                  ],
                ),
              ),
              const Divider(),
              MenuItem(
                icon: Icons.person_outline,
                text: "My Profile",
                index: 0,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: _editProfile,
              ),
              MenuItem(
                icon: Icons.lock_outline,
                text: "Reset Password",
                index: 1,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(() =>  UpdatePasswordProfile()),
              ),
              MenuItem(
                icon: Icons.language,
                text: "Language",
                index: 2,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(() => const LanguageScreen()),
              ),
              MenuItem(
                icon: Icons.file_copy_outlined,
                text: "Term & Condition",
                index: 3,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(() => const Condition()),
              ),
              MenuItem(
                icon: Icons.help_outline,
                text: "Help Center",
                index: 4,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(() => const HelpCenter()),
              ),
              MenuItem(
                icon: Icons.logout,
                text: "Log out",
                index: 5,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear(); // Clear user data on logout
                  Get.to(() =>Logout());
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const ActionIcon({required this.icon, required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final VoidCallback? onNavigate;

  const MenuItem({
    required this.icon,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    this.onNavigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blueAccent : Colors.grey[700]),
      title: Text(text,
          style: TextStyle(
              color: isSelected ? Colors.blueAccent : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios,
            size: 16, color: isSelected ? Colors.blueAccent : Colors.grey),
        onPressed: onNavigate,
      ),
      tileColor: isSelected ? Colors.blueAccent.withOpacity(0.1) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: () {
        onTap(index);
        if (onNavigate != null) onNavigate!();
      },
    );
  }
}