import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/register/register_screen.dart';
import '../contants/custom_snackbar.dart';
import '../signup/signup_screen.dart';

class Afteronboard extends StatelessWidget {
  const Afteronboard({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Stack(
      children: [
        // Main content
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Jito_Visuals!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Sign up/Log in to start your journey with us.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: Size(buttonWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.g_mobiledata, color: Colors.red),
              onPressed: () {
                // Google login logic
              },
              label: const Text("Continue with Google"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4267B2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: Size(buttonWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.facebook),
              onPressed: () {
                CustomSnackbar.showSnackbar(context, 'Will be added soon!', backgroundColor: Colors.orange);
              },
              label: const Text("Continue with Facebook"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: Size(buttonWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.push(
                  context,
                  AnimatedPageTransition(
                    page: SignupScreen(),
                    transitionType: TransitionType.fade,
                  ),
                );
              },
              label: const Text("Sign In"),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        AnimatedPageTransition(
                          page: RegisterScreen(),
                          transitionType: TransitionType.fade,
                        ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.orangeAccent,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            const Text(
              "By continuing, you agree to our Terms of Service and Privacy Policy.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),

        // Back arrow button
        Positioned(
          top: 30, // Adjust as needed for positioning
          left: 7, // Position it towards the left side
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
      ],
    );
  }
}
