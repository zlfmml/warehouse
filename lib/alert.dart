import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login-screen.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User harus menekan tombol di dialog
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Logout'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Anda yakin ingin logout?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Tutup dialog dan batalkan logout
              Navigator.of(context).pop();
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout dan tutup dialog
              performLogout(context);
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

void performLogout(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

  // Navigasi ke layar login atau halaman lain jika diperlukan
  
}
