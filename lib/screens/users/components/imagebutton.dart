import 'package:flutter/material.dart';

import '../../webview/webview_route.dart';

class BodImageOptionButtons extends StatelessWidget {
  final String buttonText;
  final String url;
  final String imageUrl; // Image URL instead of IconData

  const BodImageOptionButtons({
    super.key,
    required this.buttonText,
    required this.url,
    required this.imageUrl, // Pass the image URL
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: GestureDetector(
        onTap: () {
          // When the image is clicked, navigate to the URL
          Navigator.of(context).push(CustomWebViewPageRoute(
            url: url,
            title: buttonText,
          ));
        },
        child: Material(
          elevation: 7, // Set the elevation for shadow effect (button-like look)
          borderRadius: BorderRadius.circular(10), // Rounded corners
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10), // Margin between buttons
            width: MediaQuery.of(context).size.width * 0.9, // Responsive width
            height: 80, // Set the height for the button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Rounded corners for the image container
              // Optional background color, can be omitted for transparent button
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners for the image
              child: Image.asset(
                imageUrl, // Image URL passed in
                fit: BoxFit.fill, // Ensure image covers the entire container
              ),
            ),
          ),
        ),
      ),
    );
  }
}
