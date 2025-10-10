import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
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
              const Text(
                "Profile Setting",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/10/89/d2/1089d2ad6538747479e1f18a26ea462d.jpg",
                            ),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              const Text(
                "Ru Sunjae",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "sunjearu@gmail.com",
                style: TextStyle(color: Colors.grey),
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

              const MenuItem(icon: Icons.person_outline, text: "My Profile"),
              const MenuItem(icon: Icons.lock_outline, text: "Reset Password"),
              const MenuItem(icon: Icons.language, text: "Language"),
              const MenuItem(
                icon: Icons.file_copy_outlined,
                text: "Term & Condition",
              ),
              const MenuItem(icon: Icons.help_outline, text: "Help Center"),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.redAccent),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.redAccent,
                ),
                onTap: () {},
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

  const MenuItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
