import 'package:flutter/material.dart';

class DashedLineWithText extends StatelessWidget {
  final String text;

  const DashedLineWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black, // The color of the dashed line
            margin: const EdgeInsets.symmetric(horizontal: 8.0), // Space between line and text
            child: const DashLine(),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold), // Styling for the text
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const DashLine(),
          ),
        ),
      ],
    );
  }
}

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(10, (index) {
        return Container(
          width: 8, // width of each dash
          height: 1,
          color: Colors.black, // Dash color
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
        );
      }),
    );
  }
}
