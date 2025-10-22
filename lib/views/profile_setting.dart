import 'dart:typed_data';
import 'package:cosmetics/views/help_center.dart';
import 'package:cosmetics/views/language.dart';
import 'package:cosmetics/views/All%20Connection/logout.dart';
import 'package:cosmetics/views/profile_detail.dart';
import 'package:cosmetics/views/All%20Connection/resetpaswor_profile.dart';
import 'package:cosmetics/views/condition.dart'; // <-- Add this import
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Condition;
import 'package:image_picker/image_picker.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  int _selectedMenuIndex = -1;

  Uint8List? _image;

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final Uint8List img = await pickedFile.readAsBytes();
      setState(() {
        _image = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  "Profile Setting",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Stack(
                    children: [
                      _image != null
                          ? SizedBox(
                              width: 50,
                              height: 50,
                              child: ClipOval(
                                child: Image.memory(_image!, fit: BoxFit.cover),
                              ),
                            )
                          : SizedBox(
                              width: 50,
                              height: 50,
                              child: ClipOval(
                                child: Image.network(
                                  "https://i.pinimg.com/736x/10/89/d2/1089d2ad6538747479e1f18a26ea462d.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      // Positioned(
                      //   bottom: -15,
                      //   right: 0,
                      //   left: 20,
                      //   child: IconButton(
                      //     onPressed: selectImage,
                      //     icon: const Icon(
                      //       Icons.add_a_photo,
                      //       color: Colors.pinkAccent,
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Kim Minji",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "pammin@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ActionIcon(
                      icon: Icons.shopping_bag,
                      label: "My Order",
                      color: Colors.pinkAccent,
                    ),
                    ActionIcon(
                      icon: Icons.favorite,
                      label: "Wishlist",
                      color: Colors.redAccent,
                    ),
                    ActionIcon(
                      icon: Icons.shopping_cart,
                      label: "Cart",
                      color: Colors.amber,
                    ),
                    ActionIcon(
                      icon: Icons.quiz,
                      label: "Skin Quiz",
                      color: Colors.orangeAccent,
                    ),
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
                onNavigate: () => Get.to(ProfileDetail()),
              ),
              MenuItem(
                icon: Icons.lock_outline,
                text: "Reset Password",
                index: 1,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(/*ResetpasworProfile*/ UpdatePasswordScreen()),
              ),
              MenuItem(
                icon: Icons.language,
                text: "Language",
                index: 2,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(LanguageScreen()),
              ),

              InkWell(
                onTap: () {
                  Get.to(ProfileDetail());
                },
                child: MenuItem(
                  icon: Icons.file_copy_outlined,
                  text: "Term & Condition",
                  index: 3,
                  selectedIndex: _selectedMenuIndex,
                  onTap: (i) => setState(() => _selectedMenuIndex = i),
                 onNavigate: () => Get.to(Condition()),
                ),
              ),
              MenuItem(
                icon: Icons.help_outline,
                text: "Help Center",
                index: 4,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(HelpCenter()),
              ),
              MenuItem(
                icon: Icons.logout,
                text: "Log out",
                index: 5,
                selectedIndex: _selectedMenuIndex,
                onTap: (i) => setState(() => _selectedMenuIndex = i),
                onNavigate: () => Get.to(Logout()),
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

  const ActionIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

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
      leading: Icon(
        icon,
        color: isSelected ? Colors.blueAccent : Colors.grey[700],
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blueAccent : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: isSelected ? Colors.blueAccent : Colors.grey,
        ),
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
