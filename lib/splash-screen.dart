import 'package:flutter/material.dart';
import 'dart:async';

import 'package:irgisad/login-screen.dart';
import 'package:irgisad/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay menggunakan Timer untuk simulasi splash screen
    Timer(
      Duration(seconds: 3), // Ubah durasi sesuai kebutuhan Anda
      () {
        // Navigasi ke halaman utama setelah splash screen selesai
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Ubah sesuai desain splash screen Anda
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
