// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cosmetics/services/reset.dart'; // Your service file
// import 'SignIn.dart'; // Redirect after successful reset

// class ResetPasswordScreen extends StatefulWidget {
//   final String email;
//   final String token;

//   const ResetPasswordScreen({super.key, required this.email, required this.token});

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final TextEditingController passwordCtrl = TextEditingController();
//   final TextEditingController confirmCtrl = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;

//   ResetService resetService = ResetService();

//   resetPassword() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _loading = true;
//     });

//     try {
//       var result = await resetService.resetPassword(
//         widget.email,
//         widget.token,
//         passwordCtrl.text.trim(),
//         confirmCtrl.text.trim(),
//       );

//       if (result.containsKey('message')) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.green,
//             content: Text(result['message']),
//           ),
//         );
//         await Future.delayed(Duration(seconds: 2));
//         Get.off(() => Login()); // redirect to login screen
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.red,
//             content: Text(result['error'] ?? 'Failed to reset password'),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text("Error: $e"),
//         ),
//       );
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/bg.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Text(
//                     "Reset Password",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: passwordCtrl,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "New Password",
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) return "Enter new password";
//                       if (value.length < 6) return "Password must be at least 6 characters";
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: confirmCtrl,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Confirm Password",
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) return "Confirm your password";
//                       if (value != passwordCtrl.text) return "Passwords do not match";
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 30),
//                   GestureDetector(
//                     onTap: _loading ? null : resetPassword,
//                     child: Container(
//                       width: 160,
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: _loading ? Colors.grey : Colors.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(
//                         child: _loading
//                             ? CircularProgressIndicator(color: Colors.white)
//                             : Text(
//                                 "Reset Password",
//                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                               ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
