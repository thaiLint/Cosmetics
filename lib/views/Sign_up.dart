import 'package:cosmetics/main.dart';
import 'package:cosmetics/services/register.dart'; // ✅ new register service
import 'package:cosmetics/views/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController usernamectrl = TextEditingController();
  final TextEditingController passwordctrl = TextEditingController();
  final TextEditingController confirmpwctrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  final RegisterService _registerService = RegisterService(); // ✅ service instance

  // 🔹 Registration function
  Future<void> registration() async {
    if (_formKey.currentState!.validate()) {
      final result = await _registerService.registerUser(
        username: usernamectrl.text.trim(),
        email: emailctrl.text.trim(),
        password: passwordctrl.text.trim(),
        confirmPassword: confirmpwctrl.text.trim(),
      );

      if (result['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(result['message'], style: const TextStyle(fontSize: 18)),
          ),
        );
        Get.offAll(() => const BottomBarController());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(result['message'], style: const TextStyle(fontSize: 18)),
          ),
        );
      }
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),

                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your account now!",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // 🔹 Username field
                          TextFormField(
                            controller: usernamectrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your username';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Username",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 🔹 Email field
                          TextFormField(
                            controller: emailctrl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 🔹 Password field
                          TextFormField(
                            controller: passwordctrl,
                            obscureText: _obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
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
                          const SizedBox(height: 15),

                          // 🔹 Confirm Password field
                          TextFormField(
                            controller: confirmpwctrl,
                            obscureText: _obscureConfirm,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password';
                              }
                              if (value != passwordctrl.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureConfirm
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirm = !_obscureConfirm;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          // 🔹 Sign Up button
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: registration,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 25, 130, 169),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // 🔹 Already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const Login());
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
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
