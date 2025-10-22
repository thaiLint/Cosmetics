import 'package:cosmetics/views/All%20Connection/SignIn.dart';
import 'package:cosmetics/views/All%20Connection/Sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email = "";
  final TextEditingController emailctrl = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 90, 234, 245),
          content: Text(
            "Password Reset Email has been sent!",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      Get.off(() => Login()); // redirect after 2 seconds
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                      onPressed: (){Get.back();}, 
                      icon: Icon(Icons.arrow_back_ios_new)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Password Recovery",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Enter your email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromARGB(179, 84, 78, 78),
                                  width: 3),
                            ),
                            child: TextFormField(
                              controller: emailctrl,
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  size: 30.0,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!value.contains("@")) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 40.0),
            
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = emailctrl.text.trim();
                                });
                                resetPassword();
                              }
                            },
                            child: Container(
                              width: 140,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Send Email",
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     if (_formKey.currentState!.validate()) {
                          //       setState(() {
                          //         email = emailctrl.text.trim();
                          //       });
                          //       resetPassword();
                          //     }
                          //   },
                          //   child: Container(
                          //     width: 140,
                          //     padding: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     child: Center(
                          //       child: Text(
                          //         "Send Email",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 18.0,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style:
                                    TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignUp()); //not resetPassword()
                                },
                                child: const Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
            
                              // GestureDetector(
                              //   onTap: () {
                              //     Get.to(resetPassword());
                              //   },
                              //   child: const Text(
                              //     "Create",
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
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
