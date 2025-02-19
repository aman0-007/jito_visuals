import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
      children: [
        Row(
          children: [
            // Main title "Register"
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32, // Larger size for main title
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text color
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            // Sub-title in smaller size
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Sign Up to your account to get started',
                style: TextStyle(
                  fontSize: 16, // Smaller size for sub-title
                  color: Colors.grey, // Light grey color for sub-title
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
