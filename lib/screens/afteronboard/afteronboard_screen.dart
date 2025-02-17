import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/afteronboard/afteronboard.dart';
import '../onboard/theme/colors.dart';

class AfteronboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  SplashColors.darkBlue,
                  SplashColors.mediumBlue
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          Center(child: Afteronboard()),
        ],
      ),
    );
  }
}