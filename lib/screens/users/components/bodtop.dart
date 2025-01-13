import 'package:flutter/material.dart';

class CombinedTextWithImage extends StatelessWidget {
  const CombinedTextWithImage({super.key});

  String getGreetingMSg() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Greeting Text Widget
    double greetingFontSize = screenWidth * 0.045;
    greetingFontSize = greetingFontSize < 18 ? 18 : greetingFontSize;

    // Welcome Text Widget
    double welcomeFontSize = screenWidth * 0.045;
    welcomeFontSize = welcomeFontSize < 18 ? 18 : welcomeFontSize;

    // Image size calculation for responsiveness
    double imageSize = screenWidth * 0.18; // 18% of screen width

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20), // Adding padding for overall alignment
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8), // Semi-transparent white background
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        padding: const EdgeInsets.all(15), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and image
          children: [
            // Column with Greeting and Welcome Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Text
                Padding(
                  padding: const EdgeInsets.only(bottom: 7), // Padding below the greeting text
                  child: Text(
                    getGreetingMSg(),
                    style: TextStyle(
                      fontSize: greetingFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Welcome Text
                Padding(
                  padding: const EdgeInsets.only(top: 10), // Padding for better spacing
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: welcomeFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            // Circular Image on the Right
            ClipRRect(
              borderRadius: BorderRadius.circular(imageSize / 2.5), // Circular border
              child: Image.asset(
                'assets/bod/jito_top.jpg', // Path to your image in the assets
                width: imageSize, // Responsive width
                height: imageSize, // Responsive height
                fit: BoxFit.cover, // Maintain aspect ratio of the image
              ),
            ),
          ],
        ),
      ),
    );
  }
}
