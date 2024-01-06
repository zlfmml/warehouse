import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:irgisad/alert.dart';
import 'dart:ui';
import 'Home_Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irgisad/utils.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: CircleAvatar(
              backgroundColor: Colors.grey,
              maxRadius: 80,
              child: IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            )),
          ),
          Text(
            '' + user.email!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            label: Text("      Type Of Wirehouse",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                          height: 80,
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            label: Text("           Profile Setting",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                          height: 80,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              showLogoutConfirmationDialog(context);
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            label: Text("            L O G O U T",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
