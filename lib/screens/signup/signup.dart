import 'package:flutter/material.dart';
import 'package:jito_visuals/auth/auth_functions.dart';
import 'package:jito_visuals/screens/register/components/button.dart';
import 'package:jito_visuals/screens/register/components/dashlinetext.dart';
import '../contants/custom_snackbar.dart';
import '../register/components/termsandprivacytext.dart';
import '../register/components/textfield.dart';
import 'components/forgotpasswordtext.dart';

class Signup extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            icon: Icons.email_outlined,
            hintText: 'Email/Phone',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            icon: Icons.password_outlined,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Sign In',
            onPressed: () {
              AuthFunctions().loginUser(context, _emailController.text, _passwordController.text);
            },
            padding: const EdgeInsets.only(top: 13, bottom: 5),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: ForgotPasswordText(),
          ),
          const DashedLineWithText(text: "OR"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
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
                  CustomSnackbar.showSnackbar(context, 'Will be added soon!', backgroundColor: Colors.orange);
                },
                label: const Text("Google"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
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
                label: const Text("Facebook"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const TermsAndPrivacyText(),
        ],
      ),
    );
  }
}
