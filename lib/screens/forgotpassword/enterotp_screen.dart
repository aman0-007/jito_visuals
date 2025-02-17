import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/forgotpassword/enterotp.dart';
import 'otpheader.dart';

class EnterOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // No background color
        elevation: 0, // Remove shadow/elevation
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          OTPHeader(),
          EnterOtp(),
        ],
      ),
    );
  }
}
