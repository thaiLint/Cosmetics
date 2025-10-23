import 'package:cosmetics/main.dart';
import 'package:cosmetics/services/login.dart'; // ✅ import your service
import 'package:cosmetics/views/Sign_up.dart';
import 'package:cosmetics/views/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  // ✅ Service instance
  final LoginService _loginService = LoginService();

  // 🔹 Call login API through service
  Future<void> userlogin() async {
    final result = await _loginService.loginUser(email, password);

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            result['message'],
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      );

      // Navigate to BottomBar
      Get.offAll(() => const BottomBarController());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            result['message'],
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 237, 248),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),

                // 🔹 Logo
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/images/logos.png"),
                ),

                const SizedBox(height: 5),

                // 🔹 Title
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back to your account!",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 10),

                // 🔹 Form
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Email label
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Email input
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: emailctrl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your E-mail';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Please enter your email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Password label
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // Password input
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: passwordctrl,
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Please enter your password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Sign In button
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  setState(() {
                                    email = emailctrl.text.trim();
                                    password = passwordctrl.text.trim();
                                  });
                                  userlogin();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 25, 130, 169),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Sign In",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Forgot password link
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ForgetPassword());
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Sign up link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const SignUp());
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
