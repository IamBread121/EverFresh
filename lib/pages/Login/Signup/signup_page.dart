import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_prediction/pages/Login/Signup/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isObscured1 = true;
  bool _isObscured2 = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up Function
  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required!")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password do not match!")),
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign Up Successful!")),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage1()),
        );
  }

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
                    "Register",
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              hintText: "dummy.text@email.com",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.15))),
                        ),
                      ),
                    ),
                    //==========================================================================================================================
                    // Password Text
                    const Text(
                      "Password",
                      style: TextStyle(),
                    ),
                    // Password Text Field
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        obscureText: _isObscured1,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _isObscured1 = !_isObscured1;
                                  },
                                );
                              }),
                        ),
                      ),
                    ),
                    //==========================================================================================================================
                    // Confirm Password
                    const Text(
                      "Re-enter Password",
                      style: TextStyle(),
                    ),
                    // Password Text Field
                    TextField(
                      obscureText: _isObscured2,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscured2 = !_isObscured2;
                                },
                              );
                            }),
                      ),
                    ),
                    //==========================================================================================================================
                    // Sign Up Button
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        onTap: _signUp,
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
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
