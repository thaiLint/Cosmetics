import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  Uint8List? image;
  final picker = ImagePicker();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phonenumCoontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> selectImage() async {
    final XFile? pickedFlie = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFlie != null) {
      final Uint8List img = await pickedFlie.readAsBytes();
      setState(() {
        image = img;
      });
    }
  }

  // Upload image to firebase storage
  // ignore: non_constant_identifier_names
  Future<String> UploadProfileImage(Uint8List imageBytes, String userid) async {
    final ref = FirebaseStorage.instance.ref().child(
      'profile_image/$userid.jpg',
    );
    await ref.putData(imageBytes);
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<void> loadUserProfile(String userId) async {
    // Get user document from Firestore
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (doc.exists) {
      final data = doc.data()!;
      fullnameController.text = data['fullName'] ?? '';
      phonenumCoontroller.text = data['phone'] ?? '';
      emailController.text = data['email'] ?? '';
      addressController.text = data['address'] ?? '';

      final imageUrl = data['imageUrl'];
      if (imageUrl != null && imageUrl.isNotEmpty) {
        final networkImage = NetworkImage(imageUrl);
        setState(() {
          image = null; // Clear previous image
        });
        // Optionally you can load it into MemoryImage if needed
      }
    }
  }

  @override
  void initState() {
    super.initState();
    const userId = "user123"; // Replace with actual user ID
    loadUserProfile(userId);
  }

  // Save user profile to firestore
  Future<void> saveUserprofile(String userid) async {
    String? imageUrl;
    if (image != null) {
      imageUrl = await UploadProfileImage(image!, userid);
    }
    await FirebaseFirestore.instance.collection('user').doc(userid).set({
      'fullName': fullnameController.text,
      'phone': phonenumCoontroller.text,
      'email': emailController.text,
      'imageUrl': imageUrl ?? '',
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile saved!")));
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phonenumCoontroller.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const PlaceholderImage =
        "https://i.pinimg.com/736x/10/89/d2/1089d2ad6538747479e1f18a26ea462d.jpg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 234, 234),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "My Profile",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 45),
                ],
              ),

              const SizedBox(height: 30),

              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: image != null
                          ? MemoryImage(image!)
                          : const NetworkImage(
                                  "https://i.pinimg.com/736x/10/89/d2/1089d2ad6538747479e1f18a26ea462d.jpg",
                                )
                                as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
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
                        child: const Icon(
                          Icons.edit_square,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

               Text(
                "Kim Minji",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "pammin@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: fullnameController,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Phone Number",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: phonenumCoontroller,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                    ),
                  ),

                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      const userid = "user124";
                      await saveUserprofile(userid);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color((0xFF81D4FA)),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            blurRadius: 3,
                            offset: Offset(0, 0.2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
