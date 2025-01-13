import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../components/internet_error_dialogue.dart';

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

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(
          title: "Error",
          message: message,
          onRetry: () {
            webViewController.reload(); // Retry loading the page
          },
        );
      },
    );
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
      body: Padding(
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
            initialSettings:  InAppWebViewSettings(
              javaScriptEnabled: true,
              supportZoom: true,
            ),
            onLoadError: (controller, url, code, message) {
              _showErrorDialog(context, "Failed to load the page. Please check your internet connection.");
            },
            onLoadHttpError: (controller, url, statusCode, description) {
              _showErrorDialog(
                context,
                "Failed to load the page. HTTP error $statusCode: $description",
              );
            },
          ),
        ),
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
