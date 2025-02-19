// otp_validation_button.dart
import 'package:flutter/material.dart';

class OtpValidationButton extends StatelessWidget {
  final bool isButtonPressed;
  final VoidCallback onTap;

  const OtpValidationButton({
    super.key,
    required this.isButtonPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onTap(),
      onTapUp: (_) => onTap(),
      onTapCancel: onTap,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isButtonPressed
              ? const Color(0xFF4267B2).withOpacity(0.8)
              : const Color(0xFF4267B2),
          borderRadius: BorderRadius.circular(8),
          boxShadow: isButtonPressed
              ? []
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: const Text(
          "Validate OTP",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
