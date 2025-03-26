import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../contants/custom_snackbar.dart';
import '../contants/internet_error_dialogue.dart';

class CustomWebView extends StatefulWidget {
  final String url;
  final String title;
  final InAppWebViewController? preloadedController;

  const CustomWebView({
    super.key,
    required this.url,
    required this.title,
    this.preloadedController,
  });

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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
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
          onLoadStart: (controller, url) {
            // Show snackbar when the page starts loading
            CustomSnackbar.showSnackbar(
              context,
              'Please rotate your device for full view',
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              icon: Icons.rotate_right, // Icon for rotation suggestion
              duration: Duration(seconds: 3),
            );
          },
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
    );
  }
}
