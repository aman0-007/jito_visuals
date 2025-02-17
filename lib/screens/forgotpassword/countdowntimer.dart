// countdown_and_resend.dart
import 'dart:async';
import 'package:flutter/material.dart';

class CountdownAndResend extends StatefulWidget {
  final VoidCallback onResendEnabled;

  const CountdownAndResend({Key? key, required this.onResendEnabled}) : super(key: key);

  @override
  State<CountdownAndResend> createState() => _CountdownAndResendState();
}

class _CountdownAndResendState extends State<CountdownAndResend> {
  late String _countdownTime;
  Timer? _timer;
  int _remainingTime = 120; // 2 minutes countdown
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _countdownTime = _formatTime(_remainingTime);
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Start the countdown
  void _startCountdown() {
    setState(() {
      _isResendEnabled = false;  // Disable resend option at the start
      _remainingTime = 120;       // Reset the time to 2 minutes
      _countdownTime = _formatTime(_remainingTime);  // Format the countdown string
    });

    _timer?.cancel();  // Cancel any existing timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
          _countdownTime = _formatTime(_remainingTime);
        } else {
          _isResendEnabled = true;  // Enable resend after countdown finishes
          widget.onResendEnabled(); // Trigger the callback
          _timer?.cancel();  // Stop the countdown timer
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _isResendEnabled ? _startCountdown : null, // Start countdown again when resend is clicked
          child: Text(
            "Didn't receive? Resend",
            style: TextStyle(
              color: _isResendEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (!_isResendEnabled)
          Text(
            _countdownTime,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
      ],
    );
  }
}
