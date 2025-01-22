import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/users/ADMIN/admin_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                    child: Image.asset(
                        "assets/logo/jito.jpg")
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Text(
                      "JITO VISUALS",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),
                  ),
                  Text(
                    "Version 1.0.0",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 11
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}