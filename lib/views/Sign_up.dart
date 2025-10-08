import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController ematctrl = new TextEditingController();
  TextEditingController usernamectrl = new TextEditingController();
  TextEditingController passwordctrl = new TextEditingController();
  TextEditingController confirmpwctrl = new TextEditingController();
  String emailtext = "",
      passwordtext = "",
      usernametext = "",
      confirmpwtext = "";

  final _formKey = GlobalKey<FormState>();

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: usernamectrl,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: " Username",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                      
                          // Username
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: ematctrl,
                              decoration: InputDecoration(
                                labelText: " Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: passwordctrl,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: confirmpwctrl,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: " Comfirm  password",
                                prefixIcon: Icon(Icons.lock),
                      
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                      
                          // Password
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
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/google.png",
                                  width: 20,
                                  height: 20,
                                ),
                                label: const Text(""),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                      
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/apple.png",
                                  width: 30,
                                  height: 30,
                                ),
                                label: const Text(""),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(12),
                      
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
