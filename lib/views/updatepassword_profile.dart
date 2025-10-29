import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UpdatePasswordProfile extends StatefulWidget {
  const UpdatePasswordProfile({super.key});

  @override
  State<UpdatePasswordProfile> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordProfile> {
  final TextEditingController currentPw = TextEditingController();
  final TextEditingController newPw = TextEditingController();
  final TextEditingController confirmPw = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updatePassword() async {
    final user = auth.currentUser;
    if (user == null) {
      Get.snackbar("Error", "No user logged in");
      return;
    }

    if (newPw.text != confirmPw.text) {
      Get.snackbar("Error", "New password and confirm password do not match");
      return;
    }

    try {
      // Re-authenticate user with current password
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPw.text,
      );
      await user.reauthenticateWithCredential(cred);

      // Update password
      await user.updatePassword(newPw.text);
      Get.snackbar("Success", "Password updated successfully");

      currentPw.clear();
      newPw.clear();
      confirmPw.clear();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: currentPw,
              obscureText: _obscureCurrent,
              decoration: InputDecoration(
                labelText: "Current Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureCurrent ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscureCurrent = !_obscureCurrent),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: newPw,
              obscureText: _obscureNew,
              decoration: InputDecoration(
                labelText: "New Password",
                suffixIcon: IconButton(
                  icon: Icon(_obscureNew ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscureNew = !_obscureNew),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPw,
              obscureText: _obscureConfirm,
              decoration: InputDecoration(
                labelText: "Confirm New Password",
                suffixIcon: IconButton(
                  icon:
                      Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscureConfirm = !_obscureConfirm),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updatePassword,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}


