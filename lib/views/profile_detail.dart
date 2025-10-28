import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cosmetics/services/profile_service.dart'; // your API service

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  File? imageFile;
  final picker = ImagePicker();
  final ProfileService _profileService = ProfileService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isLoading = false;
  String? token;

  @override
  void initState() {
    super.initState();
    _loadTokenAndProfile();
  }

  Future<void> _loadTokenAndProfile() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('jwt_token'); // get API token

    // Load local image
    final path = prefs.getString('local_profile_image');
    if (path != null && File(path).existsSync()) {
      imageFile = File(path);
    }

    // Fetch profile from API
    if (token != null) await _fetchProfileFromAPI();
  }

  Future<void> _fetchProfileFromAPI() async {
    setState(() => _isLoading = true);
    final result = await _profileService.fetchProfile(token!);
    setState(() => _isLoading = false);

    if (result['success']) {
      final user = result['user'];
      setState(() {
        nameController.text = user['name'] ?? '';
        emailController.text = user['email'] ?? '';
        phoneController.text = user['phone'] ?? '';
        addressController.text = user['address'] ?? '';
      });
    } else {
      Get.snackbar("Error", "Failed to fetch profile");
    }
  }

  Future<void> selectImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
    }
  }

  Future<void> saveProfile() async {
    if (token == null) return;

    setState(() => _isLoading = true);

    final result = await _profileService.updateProfile(
      token: token!,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      imageFile: imageFile,
    );

    setState(() => _isLoading = false);

    if (result['success']) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', nameController.text.trim());
      await prefs.setString('user_email', emailController.text.trim());
      if (imageFile != null) await prefs.setString('local_profile_image', imageFile!.path);

      Get.back(result: {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'profile_image_path': imageFile?.path,
      });

      Get.snackbar("Success", "Profile updated successfully");
    } else {
      Get.snackbar("Error", "Failed to update profile: ${result['message']}");
    }
  }

  Widget _buildProfileAvatar() {
    if (imageFile != null && imageFile!.existsSync()) {
      return CircleAvatar(radius: 50, backgroundImage: FileImage(imageFile!));
    } else {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, size: 40, color: Colors.white),
      );
    }
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.grey[100],
            filled: true,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold),)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      _buildProfileAvatar(),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: selectImage,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildField("Name", nameController),
                  const SizedBox(height: 15),
                  _buildField("Phone", phoneController),
                  const SizedBox(height: 15),
                  _buildField("Email", emailController),
                  const SizedBox(height: 15),
                  _buildField("Address", addressController),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC2185B),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Save", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

