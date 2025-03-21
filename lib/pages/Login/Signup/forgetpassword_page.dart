import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Login/Signup/login_page.dart';

class ForgetpasswordPage extends StatelessWidget {
  const ForgetpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //==========================================================================================================================
                // Login Title
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //==========================================================================================================================
                // Email Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(),
                    ),
                    // Email Text Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "dummy.text@email.com",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.15))),
                        ),
                      ),
                    ),
                    //==========================================================================================================================
                    // Login Button
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage1()),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0dc6b5), Color(0xFF28d892)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //==========================================================================================================================
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}