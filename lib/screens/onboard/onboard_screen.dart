import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/onboard/onboard.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';
import 'package:jito_visuals/screens/onboard/widgets/on_boardnavigation.dart';
import 'package:jito_visuals/screens/onboard/widgets/page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const OnboardPage(
      title : "Welcome to TripLink",
      description: "Explore Hidden Gems Around the Globe.",
      imagePath: "assets/images/splashscreen/s1.jpg",
    ),
    const OnboardPage(
      title : "Plan Together, Travel Together",
      description: "Plan, book, and explore all in one place.",
      imagePath: "assets/images/splashscreen/s2.jpg",
    ),
    const OnboardPage(
      title : "Travel, Play, Connect",
      description: "Explore the world with confidence and ease.",
      imagePath: "assets/images/splashscreen/s3.jpg",
    ),
  ];

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentIndex == 1 ? Color(0xFFfffaff) : Color(0xFFffffff),
      body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "TripLink",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: SplashColors.brightOrange,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    print(_currentIndex);
                    setState(() => _currentIndex = index);
                  },
                  children: _pages,
                ),
              ),
              PageIndicator(currentIndex: _currentIndex, totalPages: _pages.length),
              OnboardNavigation(
                currentIndex: _currentIndex,
                totalPages: _pages.length,
                onSkip: () => _goToPage(_pages.length - 1),
                onNext: () => _goToPage(_currentIndex + 1),
              ),
            ],
          ),
      ),
    );
  }
}