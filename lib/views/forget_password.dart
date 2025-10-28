import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmetics/views/SignIn.dart';
import 'package:cosmetics/views/Sign_up.dart';
import 'package:cosmetics/services/forgot.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final codeCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  final forgotService = ForgotService();

  bool _loading = false;
  bool _showResetFields = false;

  /// Step 1: Request 6-digit code
  Future<void> requestCode() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    try {
      final result = await forgotService.forgotPassword(emailCtrl.text.trim());
      if (result.containsKey('code')) {
        setState(() => _showResetFields = true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Password reset code sent: ${result['code']}"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(result['error'] ?? 'Something went wrong'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Error: $e"),
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  /// Step 2: Reset password using 6-digit code
  Future<void> resetPassword() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    try {
      final result = await forgotService.resetPassword(
        email: emailCtrl.text.trim(),
        code: codeCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        passwordConfirmation: confirmCtrl.text.trim(),
      );

      if (result.containsKey('message')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(result['message']),
          ),
        );

        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(() => const Login());
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(result['error'] ?? 'Something went wrong'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Error: $e"),
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Forgot Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter your email to receive a reset code.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 25),

                    // Email
                    TextFormField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter email";
                        if (!value.contains("@")) return "Enter valid email";
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Show extra fields after code sent
                    if (_showResetFields) ...[
                      TextFormField(
                        controller: codeCtrl,
                        decoration: InputDecoration(
                          labelText: "6-Digit Code",
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter code";
                          if (value.length != 6) return "Code must be 6 digits";
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          prefixIcon: const Icon(Icons.key_outlined),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter password";
                          if (value.length < 6) return "Password must be 6+ characters";
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: confirmCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: const Icon(Icons.key),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (value) {
                          if (value != passwordCtrl.text) return "Passwords do not match";
                          return null;
                        },
                      ),
                    ],
                    const SizedBox(height: 30),

                    // Send Code / Reset Password Button
                    ElevatedButton(
                      onPressed: _loading
                          ? null
                          : _showResetFields
                              ? resetPassword
                              : requestCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC2185B),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _loading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _showResetFields ? "Reset Password" : "Send Code",
                              style: const TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                    const SizedBox(height: 20),

                    // Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () => Get.to(() => const SignUp()),
                          child: const Text(
                            "Create",
                            style: TextStyle(
                              color: Color(0xFFC2185B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Remember your password? "),
                        GestureDetector(
                          onTap: () => Get.offAll(() => const Login()),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFFC2185B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
