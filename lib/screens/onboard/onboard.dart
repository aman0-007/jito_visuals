import 'package:flutter/cupertino.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';

class OnboardPage extends StatelessWidget{
  final String title;
  final String description;
  final String imagePath;

  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300,),
        const SizedBox(height: 20,),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: SplashColors.lightOrange,
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: SplashColors.mediumBlue,
            ),
          ),
        ),
      ],
    );
  }
}