import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/login_screen/components/custom_snackbar.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/users/ADMIN/admin_home.dart';
import '../screens/users/BOD/homescreen_bod.dart';
import 'mongo_service.dart';

class AuthFunctions {
  Future<void> signUpUser(
      BuildContext context, String userType, String name, String email, String password) async {
    // Check for empty fields
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      CustomSnackbar.showSnackbar(
        context,
        'All fields are required!',
        backgroundColor: Colors.red,
      );
      return;
    }

    try {
      await MongoService.insertUser(
        name: name,
        email: email,
        password: password,
        usertype: userType,
      );

      // Success snackbar
      CustomSnackbar.showSnackbar(
        context,
        'User registered successfully!',
        backgroundColor: Colors.green,
      );
    } catch (e) {
      // Error snackbar
      CustomSnackbar.showSnackbar(
        context,
        'Error occurred while registering: $e',
        backgroundColor: Colors.red,
      );

      print(e);
    }
  }

  Future<void> loginUser(BuildContext context, String email, String password) async {
    // Check for empty fields
    if (email.isEmpty || password.isEmpty) {
      CustomSnackbar.showSnackbar(
        context,
        'Email and password are required!',
        backgroundColor: Colors.red,
      );
      return;
    }

    try {
      final users = await MongoService.fetchAllUsers();

      // Find user by email and password
      final user = users.firstWhere(
            (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      if (user.isEmpty) {
        // Invalid credentials snackbar
        CustomSnackbar.showSnackbar(
          context,
          'Invalid email or password',
          backgroundColor: Colors.red,
        );
        return;
      }

      // Determine user type
      final userType = user['userType'];

      // Save login status in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', userType);
      await prefs.setString('name', user['name']);

      switch (userType) {
        case 'admin':
        // Admin-specific snackbar
          CustomSnackbar.showSnackbar(
            context,
            'Welcome back, Admin!',
            backgroundColor: Colors.green,
          );

          // Navigate to admin home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminHomePage()),
          );
          break;

        case 'bod':
        // User-specific snackbar
          CustomSnackbar.showSnackbar(
            context,
            'Welcome back, BOD!',
            backgroundColor: Colors.blue,
          );

          // Navigate to BOD home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomescreenBod()),
          );
          break;

        default:
        // Unknown user type snackbar
          CustomSnackbar.showSnackbar(
            context,
            'Unknown user type. Please contact support.',
            backgroundColor: Colors.orange,
          );
          break;
      }
    } catch (e) {
      // Error snackbar
      CustomSnackbar.showSnackbar(
        context,
        'Error occurred while logging in: $e',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      final userType = prefs.getString('userType');

      switch (userType) {
        case 'admin':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminHomePage()),
          );
          break;

        case 'bod':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomescreenBod()),
          );
          break;

        default:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
