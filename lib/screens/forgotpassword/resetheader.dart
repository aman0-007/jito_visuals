import 'package:flutter/material.dart';

class ResetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
      children: [
        Row(
          children: [
            // Main title "Register"
            Padding(
              padding: EdgeInsets.only(left: 30.0,bottom: 2),
              child: Text(
                'Forgot/Reset Password',
                style: TextStyle(
                  fontSize: 24, // Larger size for main title
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text color
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns the text to the left
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 7),
              child: Text(
                "Enter the registered email or mobile number, and we will send you an OTP to reset your password.",
                style: TextStyle(
                  fontSize: 14, // Smaller size for sub-title
                  color: Colors.grey, // Light grey color for sub-title
                ),
                softWrap: true, // Ensures the text wraps to the next line
                overflow: TextOverflow.visible, // Avoids text overflow clipping
              ),
            ),
          ],
        )

      ],
    );
  }
}
