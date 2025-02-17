import 'package:flutter/material.dart';

class OTPHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.0,bottom: 2),
          child: Text(
            'Enter OTP',
            style: TextStyle(
              fontSize: 24, // Larger size for main title
              fontWeight: FontWeight.bold,
              color: Colors.black, // Black text color
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 45),
          child: Text(
            "Enter the otp received on your registered email or mobile number to reset your password.",
            style: TextStyle(
              fontSize: 14, // Smaller size for sub-title
              color: Colors.grey, // Light grey color for sub-title
            ),
            softWrap: true, // Ensures the text wraps to the next line
            overflow: TextOverflow.visible, // Avoids text overflow clipping
          ),
        )

      ],
    );
  }
}
