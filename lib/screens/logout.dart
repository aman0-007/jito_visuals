import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _performLogout(BuildContext context) async {
    // Access SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // Clear all stored data
    await prefs.clear();

    // Navigate to the login page (replace '/login' with your actual login route)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Show a confirmation dialog before logging out
        final shouldLogout = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // Cancel logout
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // Confirm logout
                child: const Text("Logout"),
              ),
            ],
          ),
        );

        // Perform logout if confirmed
        if (shouldLogout == true) {
          await _performLogout(context);
        }
      },
      icon: const Icon(Icons.logout),
      label: const Text("Logout"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Button color
        foregroundColor: Colors.white, // Text and icon color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
