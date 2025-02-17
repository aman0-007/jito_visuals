import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get_storage/get_storage.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late String _greeting;
  late String _timeIcon;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _updateGreeting();
    _controller.forward();

    // Update greeting every minute
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateGreeting();
    });
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    setState(() {
      if (hour < 12) {
        _greeting = 'Good Morning';
        _timeIcon = '🌅';
      } else if (hour < 17) {
        _greeting = 'Good Afternoon';
        _timeIcon = '☀️';
      } else if (hour < 21) {
        _greeting = 'Good Evening';
        _timeIcon = '🌅';
      } else {
        _greeting = 'Good Night';
        _timeIcon = '🌙';
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final box = GetStorage();

    return Container(
      width: isSmallScreen ? size.width * 0.9 : 600,
      margin: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? size.width * 0.05 : (size.width - 600) / 2,
        vertical: 16,
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: EdgeInsets.all(isSmallScreen ? 20 : 32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF00537A),
                const Color(0xFF00537A).withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(isSmallScreen ? 20 : 30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00537A).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _greeting,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 24 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if ((box.read('user_data')?['fname'] ?? '').isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            box.read('user_data')['fname'],
                            style: TextStyle(
                              color: const Color(0xFFF5A201),
                              fontSize: isSmallScreen ? 18 : 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Text(
                          _getTimeString(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: isSmallScreen ? 14 : 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _timeIcon,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 40 : 48,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.tips_and_updates,
                      color: const Color(0xFFF5A201),
                      size: isSmallScreen ? 20 : 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _getMotivationalMessage(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 14 : 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeString() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  String _getMotivationalMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Start your day with positivity and purpose!";
    } else if (hour < 17) {
      return "Keep up the great work, you're doing amazing!";
    } else if (hour < 21) {
      return "Reflect on your achievements and plan for tomorrow.";
    } else {
      return "Time to rest and recharge for another great day ahead.";
    }
  }
}