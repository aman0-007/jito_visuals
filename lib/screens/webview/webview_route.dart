import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jito_visuals/screens/webview/customwebview.dart';

class CustomWebViewPageRoute extends PageRouteBuilder {
  final String url;
  final String title;
  final InAppWebViewController? preloadedController;

  CustomWebViewPageRoute({
    required this.url,
    required this.title,
    this.preloadedController,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomWebView(
        url: url,
        title: title,
        preloadedController: preloadedController,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Slide from right to left
      const end = Offset.zero; // End at original position
      const curve = Curves.easeInOut; // Smooth easing curve

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // Adding FadeTransition for smoothness
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(position: offsetAnimation, child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 500), // Adjust the duration for smoothness
  );
}
