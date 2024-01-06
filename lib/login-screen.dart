import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irgisad/Home_Page.dart';
import 'package:irgisad/get_username_page.dart';
import 'package:irgisad/register-screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irgisad/utils.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  bool _loginSuccess = false;
  
 

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _textControllerEmail.text.trim(),
        password: _textControllerPassword.text.trim());
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
        
  }
  

  @override
  void dispose() {
    _textControllerEmail.dispose();
    _textControllerPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ini buat logo nanti lu masukin aja sesuain
                Image.asset('assets/logo_login.png'),

                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: _textControllerEmail,
                  style: TextStyle(
                      color: Colors.white), // Mengatur warna teks input
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),

                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: _textControllerPassword,
                  obscureText: true,
                  style: TextStyle(
                      color: Colors.white), // Mengatur warna teks input
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password",
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        signIn();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      )),
                  color: Colors.blue,
                ),

                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Text(
                      "Or",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                    ),
                   
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
