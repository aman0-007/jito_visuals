import 'package:flutter/material.dart';

import 'views/apexview.dart';
import 'views/zoneview.dart';

class ApexPage extends StatelessWidget {
  const ApexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1c6697), // Dark blue
                  Color(0xFF80d0c7), // Light teal
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Apex',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Apex View Button
                  _buildButton(
                    context,
                    text: 'Apex View',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ApexView()),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Zone View Button
                  _buildButton(
                    context,
                    text: 'Zone View',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ZoneViewPage()),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Project View Button
                  _buildButton(
                    context,
                    text: 'Project View',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ZoneViewPage()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5, // Add button shadow
        shadowColor: Colors.black,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


