import 'package:cosmetics/views/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController ematctrl = TextEditingController();

  final TextEditingController usernamectrl = TextEditingController();

  final TextEditingController passwordctrl = TextEditingController();

  final TextEditingController confirmpwctrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  Future<void> registration(BuildContext context) async {
    String emailtext = ematctrl.text.trim();
    String passwordtext = passwordctrl.text.trim();
    String confirmpwtext = confirmpwctrl.text.trim();

    if (passwordtext != confirmpwtext) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailtext,
        password: passwordtext,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration successfully"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email format.";
      } else {
        message = "Error: ${e.message}";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
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
                const SizedBox(height: 20),

                // Logo
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
                  "Welcome back to your account!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 122, 145, 156),
                  ),
                ),

                const SizedBox(height: 5),

                // Login form
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Username
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),

                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: usernamectrl,
                              decoration: InputDecoration(
                                labelText: " Username",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Email
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),

                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ' Enter your email';
                                }
                                return null;
                              },
                              controller: ematctrl,
                              decoration: InputDecoration(
                                labelText: " Email",
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Password
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),

                            child: TextFormField(
                              controller: passwordctrl,
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter enter the password';
                                }
                                return null;
                              },

                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Confirm password
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),

                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Re enter the password';
                                }
                                return null;
                              },
                              controller: confirmpwctrl,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: " Confirm password",
                                prefixIcon: const Icon(Icons.lock),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  registration(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  25,
                                  130,
                                  169,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Divider (Or)
                          const Row(
                            children: [
                              Expanded(child: Divider(thickness: 2)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Or"),
                              ),
                              Expanded(child: Divider(thickness: 2)),
                            ],
                          ),

                          const SizedBox(height: 5),

                          // Social buttons (no change)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/apple.png",
                                  width: 20,
                                  height: 20,
                                ),
                                label: const Text(""),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/apple.png",
                                  width: 30,
                                  height: 30,
                                ),
                                label: const Text(""),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
