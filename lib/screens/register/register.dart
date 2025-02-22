import 'package:flutter/material.dart';
import 'package:jito_visuals/auth/auth_functions.dart';
import 'package:jito_visuals/auth/google_auth.dart';
import 'package:jito_visuals/screens/register/components/button.dart';
import 'package:jito_visuals/screens/register/components/dashlinetext.dart';
import 'package:jito_visuals/screens/register/components/passwordrules.dart';
import '../contants/custom_snackbar.dart';
import 'components/termsandprivacytext.dart';
import 'components/textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState  extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final AuthService _authService = AuthService();

  void clearFields() {
    setState(() {
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _numberController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            icon: Icons.person_outlined,
            hintText: 'First Name',
            keyboardType: TextInputType.name,
            controller: _firstNameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            icon: Icons.person_outlined,
            hintText: 'Last Name',
            keyboardType: TextInputType.name,
            controller: _lastNameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            icon: Icons.email_outlined,
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            icon: Icons.phone_outlined,
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
            controller: _numberController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  icon: Icons.password_outlined,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                ),
              ),
              const SizedBox(width: 4),
              const PasswordRulesButton()
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Create Account',
            onPressed: () {
              AuthFunctions().signUpUser(context, _firstNameController.text.toUpperCase(), _lastNameController.text.toUpperCase(), _emailController.text, int.parse(_numberController.text) ?? 0, _passwordController.text);
            },
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
                onPressed: () async {
                  //final user =
                  await _authService.signInWithGoogle(context);
                  // if (user != null) {
                  //   CustomSnackbar.showSnackbar(context, 'User Registered Successfully!', backgroundColor: Colors.green);
                  // }
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
