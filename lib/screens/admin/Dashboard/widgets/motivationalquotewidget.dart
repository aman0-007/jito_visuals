import 'package:flutter/material.dart';
import 'dart:math';

class MotivationalQuoteWidget extends StatefulWidget {
  const MotivationalQuoteWidget({Key? key}) : super(key: key);

  @override
  State<MotivationalQuoteWidget> createState() => _MotivationalQuoteWidgetState();
}

class _MotivationalQuoteWidgetState extends State<MotivationalQuoteWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> quotes = [
    {
      "quote": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs"
    },
    {
      "quote": "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      "author": "Winston Churchill"
    },
    {
      "quote": "The future belongs to those who believe in the beauty of their dreams.",
      "author": "Eleanor Roosevelt"
    },
    {
      "quote": "Don't watch the clock; do what it does. Keep going.",
      "author": "Sam Levenson"
    },
    {
      "quote": "The only limit to our realization of tomorrow will be our doubts of today.",
      "author": "Franklin D. Roosevelt"
    },
    {
      "quote": "Believe you can and you're halfway there.",
      "author": "Theodore Roosevelt"
    },
    {
      "quote": "Everything you've ever wanted is on the other side of fear.",
      "author": "George Addair"
    },
    {
      "quote": "Life is 10% what happens to you and 90% how you react to it.",
      "author": "Charles R. Swindoll"
    }
  ];

  late Map<String, String> currentQuote;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    currentQuote = _getRandomQuote();
    _controller.forward();
  }

  Map<String, String> _getRandomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate responsive values
    final double containerWidth = screenSize.width > 600 ? 600 : screenSize.width * 0.9;
    final double containerPadding = screenSize.width > 600 ? 40 : 20;
    final double quoteIconSize = screenSize.width > 600 ? 48 : 32;
    final double quoteFontSize = screenSize.width > 600 ? 24 : 18;
    final double authorFontSize = screenSize.width > 600 ? 18 : 14;

    return Center(
      child: Container(
        width: containerWidth,
        margin: EdgeInsets.symmetric(
          horizontal: screenSize.width > 600 ? (screenSize.width - containerWidth) / 2 : 20,
          vertical: 16,
        ),
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF00537A),
              const Color(0xFF00537A).withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(screenSize.width > 600 ? 30 : 20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00537A).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.format_quote,
                size: quoteIconSize,
                color: const Color(0xFFF5A201),
              ),
              SizedBox(height: containerPadding / 2),
              Text(
                currentQuote['quote']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: quoteFontSize,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
              SizedBox(height: containerPadding / 2),
              Text(
                "- ${currentQuote['author']!}",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: authorFontSize,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}