import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController ematctrl = TextEditingController();
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController confirmpwctrl = TextEditingController();

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
                        TextField(
                          controller: ematctrl,
                          decoration: InputDecoration(
                            labelText: "Email",

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Username
                        TextField(
                          controller: usernamectrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: " Username",

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Password
                        TextField(
                          controller: passwordctrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Confirm password
                        TextField(
                          controller: confirmpwctrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: " Comfirm  password",
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Sign Up button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                25,
                                130,
                                169,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
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
                            InkWell(
                              child: Image.asset(
                                "assets/images/google.png",
                                height: 50,
                              ),
                            ),
                            const SizedBox(width: 25),
                            InkWell(
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
