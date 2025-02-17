import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/forgotpassword/enterotp_screen.dart';
import 'package:jito_visuals/screens/register/components/textfield.dart';
import '../register/components/button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailphoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            icon: Icons.security_update_good_outlined,
            hintText: 'Email or Mobile Number',
            keyboardType: TextInputType.name,
            controller: _emailphoneController,
          ),

          CustomButton(
            text: 'Get OTP',
            textColor: Colors.white,
            buttonColor: const Color(0xFF4267B2),
            onPressed: () {
              Navigator.push(
                context,
                AnimatedPageTransition(
                  page: EnterOtpScreen(),
                  transitionType: TransitionType.slideFromRight,
                ),
              );
            },
            padding: EdgeInsets.only(top: 13, bottom: 5),
          ),

          SizedBox(height: screenHeight * 0.009), // Space after the OTP button

          // Back to Login Link
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(context);
              },
              child: Text(
                "Back to Login",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w900,
                  fontSize: 14
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
