import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebView extends StatefulWidget {
  final String url;
  final String title;
  final InAppWebViewController? preloadedController;

  const CustomWebView({
    Key? key,
    required this.url,
    required this.title,
    this.preloadedController,
  }) : super(key: key);

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late InAppWebViewController webViewController;

  @override
  void initState() {
    super.initState();
    if (widget.preloadedController != null) {
      webViewController = widget.preloadedController!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF1c6697), // Dark blue AppBar
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1c6697), // Dark blue
                  Color(0xFF80d0c7), // Light teal
                ],
              ),
            ),
          ),
          // Curved Background Elements
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -40,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // WebView Content
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RotatedBox(
              quarterTurns: 1,
              child: InAppWebView(
                initialUrlRequest: widget.preloadedController == null
                    ? URLRequest(url: WebUri(widget.url))
                    : null,
                onWebViewCreated: (controller) {
                  if (widget.preloadedController == null) {
                    webViewController = controller;
                  }
                },
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  supportZoom: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
