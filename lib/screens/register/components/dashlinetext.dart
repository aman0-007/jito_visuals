import 'package:flutter/material.dart';

class DashedLineWithText extends StatelessWidget {
  final String text;

  DashedLineWithText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black, // The color of the dashed line
            margin: EdgeInsets.symmetric(horizontal: 8.0), // Space between line and text
            child: DashLine(),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold), // Styling for the text
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: DashLine(),
          ),
        ),
      ],
    );
  }
}

class DashLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(10, (index) {
        return Container(
          width: 8, // width of each dash
          height: 1,
          color: Colors.black, // Dash color
          margin: EdgeInsets.symmetric(horizontal: 2.0),
        );
      }),
    );
  }
}
