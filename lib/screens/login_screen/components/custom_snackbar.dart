import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(
      BuildContext context,
      String message, {
        Color? backgroundColor,
        Color textColor = Colors.white,
        IconData? icon,
        Duration duration = const Duration(seconds: 3),
      }) {
    final snackBar = CustomSnackBarWidget(
      message: message,
      backgroundColor: backgroundColor ?? Colors.blue,
      textColor: textColor,
      icon: icon ?? Icons.info_outline,
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: snackBar,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        behavior: SnackBarBehavior.floating, // Ensures floating snackbar
        margin: const EdgeInsets.all(16),   // Adds spacing around snackbar
      ),
    );
  }
}

class CustomSnackBarWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Duration duration;

  CustomSnackBarWidget({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return _AnimatedSnackbar(
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      duration: duration,
    );
  }
}

class _AnimatedSnackbar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Duration duration;

  _AnimatedSnackbar({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.duration,
  });

  @override
  _AnimatedSnackbarState createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<_AnimatedSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Smooth slide-in animation
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start below the screen
      end: Offset.zero,          // Final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Stack(
        children: [
          // Thin progress bar at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.transparent,
              value: _controller.value,
            ),
          ),
          // Main snackbar content
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: widget.textColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.message,
                    style: TextStyle(color: widget.textColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
