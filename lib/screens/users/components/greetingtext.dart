import 'package:flutter/material.dart';

class GreetingTopText extends StatelessWidget {
  const GreetingTopText({super.key});

  String getGreetingMSg() {
    final hour = DateTime.now().hour;
    if ( hour < 12 ) {
      return 'Good Morning';
    } else if ( hour < 17 ) {
      return 'Good Afternoon';
    } else if ( hour < 20 ) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {

    final greetingMsg = getGreetingMSg();

    return Text(
      greetingMsg,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}