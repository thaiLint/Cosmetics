import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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

                // Title
                const Text(
                  "Sign In",
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

                const SizedBox(height: 20),

                // Login form
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Email
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Please enter your email",

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Please enter your password",
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 3),

                        // Forget password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forget password?",
                              style: TextStyle(
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.redAccent,
                                decorationThickness: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Sign In button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 25, 130, 169),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Divider (Or)
                        Row(
                          children: const [
                            Expanded(child: Divider(thickness: 2)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Or"),
                            ),
                            Expanded(child: Divider(thickness: 2)),
                          ],
                        ),

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/google.png",
                                height: 50,
                              ),
                            ),
                            const SizedBox(width: 25),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/apple.png",
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
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
