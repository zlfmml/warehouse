import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irgisad/greeting_screen.dart';
import 'package:irgisad/login-screen.dart';

class UsernameCreate extends StatefulWidget {
  const UsernameCreate({super.key});

  @override
  State<UsernameCreate> createState() => _UsernameCreateState();
}

class _UsernameCreateState extends State<UsernameCreate> {
  final _textControllerUsername = TextEditingController();
 

  Future<void> addUserDetails(
    String username,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    'assets/icons8-create-new-ePw.png',
                  )),
                  SizedBox(height: 20),
                  Text(
                    'GET USERNAME',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Select The Username For The New Account.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'You Can Always Change It Later.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: _textControllerUsername,
                    style: TextStyle(
                        color: Colors.white), // Mengatur warna teks input
                    decoration: InputDecoration(
                        hintText: "Enter Username",
                        filled: true,
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey.shade800,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            addUserDetails(_textControllerUsername.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GreetingScreen()));
                          },
                          child: Container(
                            width: 45 * fem,
                            height: 45 * fem,
                            child: Image.asset(
                              'assets/vector-Ads.png',
                              width: 28 * fem,
                              height: 28 * fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
