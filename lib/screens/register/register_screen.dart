import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/register/components/header.dart';
import 'package:jito_visuals/screens/register/register.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent, // No background color
        elevation: 0, // Remove shadow/elevation
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          RegisterHeader(),
          Register(),
        ],
      ),
    );
  }
}
