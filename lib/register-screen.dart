import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:irgisad/get_username_page.dart';
import 'package:irgisad/login-screen.dart';
import 'package:irgisad/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _textControllerConfirmPassword = TextEditingController();

  @override
  Future signUp() async {
    if (passwordConfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _textControllerEmail.text.trim(),
          password: _textControllerPassword.text.trim());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UsernameCreate()));
    }
    addUserDetails(
      _textControllerEmail.text.trim(),
    );
  }

  Future<void> addUserDetails(
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
    });
  }

  bool passwordConfirm() {
    if (_textControllerPassword.text.trim() ==
        _textControllerConfirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.grey.shade900,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ini buat logo nanti lu masukin aja sesuain
                Image.asset('assets/splash.png'),

                //ini buat form nya

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

                TextField(
                  controller: _textControllerConfirmPassword,
                  obscureText: true,
                  style: TextStyle(
                      color: Colors.white), // Mengatur warna teks input
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  // vectorNJH (13:110)
                  margin:
                      EdgeInsets.fromLTRB(310 * fem, 0 * fem, 0 * fem, 0 * fem),
                  child: TextButton(
                    onPressed: () {
                      signUp();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 28 * fem,
                      height: 28 * fem,
                      child: Image.asset(
                        'assets/vector-Ads.png',
                        width: 28 * fem,
                        height: 28 * fem,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
