import 'package:flutter/material.dart';
import '../../onboard/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color buttonColor;
  final Color textColor;
  final double width;
  final EdgeInsetsGeometry padding; // Added padding parameter

  CustomButton({
    required this.text,
    required this.onPressed,
    this.buttonColor = SplashColors.lightOrange,
    this.textColor = Colors.black,
    this.width = double.infinity,
    this.padding = const EdgeInsets.only(top: 13.0, bottom: 25, left: 0, right: 0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, // Use the provided padding
      child: Container(
        width: width,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: SplashColors.mediumBlue,
            elevation: 2,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
