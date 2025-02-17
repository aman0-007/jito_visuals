import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/contants/themes.dart';
import '../../contants/custom_snackbar.dart';

class PasswordRulesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomSnackbar.showSnackbar(
          context,
          "• Must be at least 8 characters long\n• Must contain at least one uppercase letter\n• Must contain at least one number\n• Must contain at least one special character",
          backgroundColor: TripLinkTheme.lightColorScheme.primary,
          textColor: Colors.white,
          //icon: Icons.check_circle,
          duration: Duration(seconds: 3),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.help_outline,
          color: Colors.grey,
          size: 27,
        ),
      ),
    );
  }
}
