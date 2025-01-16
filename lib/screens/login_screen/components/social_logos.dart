import 'package:flutter/material.dart';

import 'custom_snackbar.dart';

class SocialLogos extends StatelessWidget {
  const SocialLogos({Key? key}) : super(key: key);

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomSnackBarWidget(
          message: message,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          icon: Icons.info_outline,
          duration: const Duration(seconds: 3),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => showCustomSnackBar(
              context,
              'Google login method will be added soon.',
            ),
            child: Image.asset('assets/images/google.png'),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () => showCustomSnackBar(
              context,
              'Facebook login method will be added soon.',
            ),
            child: Image.asset('assets/images/facebook.png'),
          ),
        ],
      ),
    );
  }
}