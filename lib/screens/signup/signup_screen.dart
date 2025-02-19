import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/signup/signup.dart';
import 'components/signupheader.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SignupHeader(),
          Signup(),
        ],
      ),
    );
  }
}