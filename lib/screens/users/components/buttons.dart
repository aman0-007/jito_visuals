import 'package:flutter/material.dart';
import '../BOD/customwebview.dart';

class BodOptionButtons extends StatelessWidget {
  final String buttonText;
  final String url;
  final IconData icon;

  const BodOptionButtons({
    super.key,
    required this.buttonText,
    required this.url,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Margin between buttons
      width: MediaQuery.of(context).size.width * 0.9, // Responsive width
      padding: const EdgeInsets.symmetric(vertical: 15), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.blue.shade200, // Background color (adjust to fit your theme)
        borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(0, 2), // Shadow effect for depth
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side - Icon (25% of the container)
          Container(
            width: MediaQuery.of(context).size.width * 0.2, // 25% width
            child: Icon(
              icon, // Icon passed in
              size: 30,
              color: Colors.white,
            ),
          ),

          // Middle - Text (50% of the container)
          Container(
            width: MediaQuery.of(context).size.width * 0.5, // 50% width
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16, // Adjust text size as needed
                  fontWeight: FontWeight.bold, // Text boldness
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Right side - Arrow Button to navigate (25% of the container)
          Container(
            width: MediaQuery.of(context).size.width * 0.2, // 25% width for the button
            alignment: Alignment.centerRight, // Align button to the right
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20, // Button size
              ),
              onPressed: () {
                Navigator.of(context).push(CustomWebViewPageRoute(
                  url: url,
                  title: buttonText,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
