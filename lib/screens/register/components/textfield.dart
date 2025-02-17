import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  CustomTextField({
    required this.icon,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // For toggling visibility of password text

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5), // #f5f5f5 background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: TextField(
        controller: widget.controller, // Set the controller
        obscureText: widget.keyboardType == TextInputType.visiblePassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: Color(0xFF818181), // #818181 icon color
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFFB0B0B0), // Light grey hint text
          ),
          border: InputBorder.none, // No border
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding inside the text field
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color(0xFF818181), // Icon color
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle visibility
              });
            },
          )
              : null, // No suffix icon if it's not a password field
        ),
      ),
    );
  }
}
