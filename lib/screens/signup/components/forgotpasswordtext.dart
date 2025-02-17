import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/forgotpassword/forgotpassword_screen.dart';

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              AnimatedPageTransition(
                page: ForgotpasswordScreen(),
                transitionType: TransitionType.fade,
              ),
            );
          },
          child: Text(
            'forgot password?',
            style: TextStyle(
              fontSize: 14, // Larger size for main title
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent, // Black text color
            ),
          ),
        ),
      ],
    );
  }
}
