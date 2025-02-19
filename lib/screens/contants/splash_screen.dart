import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jito_visuals/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _textSlideAnimation = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Theme.of(context).scaffoldBackgroundColor : Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: screenSize.width * 0.6, // Responsive width
                          height: screenSize.width * 0.6, // Maintain aspect ratio
                          constraints: const BoxConstraints(
                            maxWidth: 300, // Maximum width
                            maxHeight: 300, // Maximum height
                            minWidth: 150, // Minimum width
                            minHeight: 150, // Minimum height
                          ),
                          child: Image.asset(
                            "assets/logo/jito.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _textSlideAnimation.value),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: screenSize.height * 0.02, // Responsive padding
                      ),
                      child: Column(
                        children: [
                          Text(
                            "JITO VISUALS",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenSize.width * 0.04, // Responsive font size
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.005),
                          Text(
                            "Version 1.0.0",
                            style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.black.withOpacity(0.7),
                              fontSize: screenSize.width * 0.028, // Responsive font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}