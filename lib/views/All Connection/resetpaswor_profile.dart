import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
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


// import 'package:cosmetics/views/All%20Connection/forget_password.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class ResetpasworProfile extends StatefulWidget {
//   const ResetpasworProfile({super.key});

//   @override
//   State<ResetpasworProfile> createState() => _ResetpasworProfileState();
// }
 
// class _ResetpasworProfileState extends State<ResetpasworProfile> {
//   final TextEditingController currenpw = TextEditingController();
//   final TextEditingController newpw = TextEditingController();
//   final TextEditingController confirmpw = TextEditingController();
//   bool _obscureCurrent = true;
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   Future<void> updatepassword() async {
//     final user = auth.currentUser;
//     if (user == null) {
//       Get.snackbar("Error", "No user logged in");
//       return;
//     }
//     if (newpw.text != confirmpw.text) {
//       Get.snackbar("Error", "New password and confirm password do not match");
//       return;
//     }
//     try {
//       final cred = EmailAuthProvider.credential(
//         email: user.email!,
//         password: currenpw.text,
//       );
//       await user.reauthenticateWithCredential(cred);
//       // Update password
//       await user.updatePassword(newpw.text);
//       Get.snackbar("Success", "Password updated successfully");
//       currenpw.clear();
//       newpw.clear();
//       confirmpw.clear();
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   } // <-- This closes updatepassword()

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       width: 45,
//                       height: 45,
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 243, 234, 234),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12.withOpacity(0.1),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "Reset Password",
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 45),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Text("Current Password", style: TextStyle(fontSize: 18)),
//               const SizedBox(height: 5),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(),
//                 child: TextFormField(
//                   controller: currenpw,
//                   obscureText: _obscureCurrent,
//                   decoration: InputDecoration(
//                     hintText: "Please enter current password",
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscureCurrent = !_obscureCurrent;
//                         });
//                       },
//                       icon: Icon(
//                         _obscureCurrent
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     Get.to(ForgetPassword());
//                   },
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(ForgetPassword());
//                     },
//                     child: Text(
//                       "Forget password?".tr,
//                       style: TextStyle(
//                         color: Colors.redAccent,
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.redAccent,
//                         decorationThickness: 1.5,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text("New password", style: TextStyle(fontSize: 18)),
//               const SizedBox(height: 5),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 child: TextFormField(
//                   controller: newpw,
//                   obscureText: _obscureNew,
//                   decoration: InputDecoration(
//                     hintText: "Please enter new password",
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscureNew = !_obscureNew;
//                         });
//                       },
//                       icon: Icon(
//                         _obscureNew ? Icons.visibility_off : Icons.visibility,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text("Confirm new password", style: TextStyle(fontSize: 18)),
//               const SizedBox(height: 5),
//               Container(
//                 width: double.infinity,
//                 height: 50,
//                 child: TextFormField(
//                   controller: confirmpw,
//                   obscureText: _obscureConfirm,
//                   decoration: InputDecoration(
//                     hintText: "Please enter confirm new password",
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscureConfirm = !_obscureConfirm;
//                         });
//                       },
//                       icon: Icon(
//                         _obscureConfirm
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: updatepassword,
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color((0xFF81D4FA)),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white.withOpacity(0.9),
//                         blurRadius: 3,
//                         offset: Offset(0, 0.2),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Save",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }