import 'package:flutter/cupertino.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          totalPages,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentIndex == index ? 12 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? SplashColors.lightOrange
                  : SplashColors.mediumBlue,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ),
    );
  }
}