import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/afteronboard/afteronboard_screen.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';

class OnboardNavigation extends StatelessWidget{
  final int currentIndex;
  final int totalPages;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardNavigation({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onSkip,
    required this.onNext,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentIndex < totalPages - 1)
            TextButton(
                onPressed: onSkip,
                child: const Text(
                  "Skip",
                  style: TextStyle(color: SplashColors.lightOrange),
                ),
            ),

          if (currentIndex < totalPages - 1)
            TextButton(
              onPressed: onNext,
              child: const Text(
                "Next",
                style: TextStyle(color: SplashColors.lightOrange),
              )
            )
          else
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SplashColors.brightOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    AnimatedPageTransition(
                      page: AfteronboardScreen(),
                      transitionType: TransitionType.slideFromRight,
                    )
                  );
                },
                child: const Text(
                  "Explore",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
        ],
      ),
    );
  }
}