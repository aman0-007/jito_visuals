import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../onboard/theme/colors.dart';

class TermsAndPrivacyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To take the minimum space
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By creating an account or signing in, you have read and agreed to \n",
                style: TextStyle(
                  fontSize: 12, // Regular text size
                  color: SplashColors.darkBlue, // Default text color
                ),
                children: [
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: SplashColors.brightOrange, // Color for Privacy Policy
                      fontWeight: FontWeight.bold, // Bold text for Privacy Policy
                      fontSize: 13, // Font size for Privacy Policy
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Action for Privacy Policy tap
                    },
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      color: SplashColors.darkBlue, // Default text color for the 'and'
                      fontSize: 13, // Font size for 'and'
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of Service.',
                    style: TextStyle(
                      color: SplashColors.brightOrange, // Color for Terms of Service
                      fontWeight: FontWeight.bold, // Bold text for Terms of Service
                      fontSize: 13, // Font size for Terms of Service
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Action for Terms of Service tap
                    },
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
