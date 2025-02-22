import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/afteronboard/afteronboard_screen.dart';
import 'package:jito_visuals/screens/contants/bottomnavigation.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/register/register.dart';
import '../screens/contants/custom_snackbar.dart';
import 'mongo_service.dart';

class AuthFunctions {
  final box = GetStorage();

  Future<void> signUpUser(BuildContext context, String fname, String lname, String email, int number, String password) async {
    if (fname.isEmpty || lname.isEmpty || email.isEmpty || password.isEmpty || number <= 0) {
      CustomSnackbar.showSnackbar(context, 'All fields are required!', backgroundColor: Colors.red);
      return;
    }

    // Password validation
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$'); // Must contain an uppercase, a number, a special character, and be at least 8 characters long

    if (!passwordRegex.hasMatch(password)) {
      CustomSnackbar.showSnackbar(
        context,
        'Password must meet the following criteria:\n• At least 8 characters long\n• At least one uppercase letter\n• At least one number\n• At least one special character',
        backgroundColor: Colors.red,
      );
      return;
    }

    String hashedPassword = hashPassword(password);
    try {
      await MongoService.insertUser(
        context: context,
        fname: fname,
        lname: lname,
        email: email,
        number: number,
        password: hashedPassword,
      );

      // Show success message
      CustomSnackbar.showSnackbar(context, 'User Registered Successfully!', backgroundColor: Colors.green);

      // Clear input fields
      Navigator.pop(context); // Pop first to avoid UI lag
      Future.delayed(Duration(milliseconds: 300), () {
        clearTextFields(context);
      });
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error: $e', backgroundColor: Colors.red);
    }
  }

// Function to clear text fields
  void clearTextFields(BuildContext context) {
    final state = context.findAncestorStateOfType<RegisterState>();
    if (state != null) {
      state.clearFields();
    }
  }

  Future<void> loginUser(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CustomSnackbar.showSnackbar(context, 'Email and password are required!', backgroundColor: Colors.red);
      return;
    }

    try {
      final user = await MongoService.getUserByEmail(email);
      if (user == null || !verifyPassword(password, user['password'])) {
        CustomSnackbar.showSnackbar(context, 'Invalid email or password', backgroundColor: Colors.red);
        return;
      }

      Map<String, dynamic> userData = {
        'isLoggedIn': true,
        'userType': user['userType'],
        'fname': user['first_name'],
        'lname': user['last_name'],
        'email': user['email'],
        'mobile_no': user['mobile_no'].toString(),
        'link': user['dashlink']
      };

      await box.write('user_data', userData);
      await box.save();

      _navigateToHome(context, userData['userType']);
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error occurred while logging in: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    final userData = box.read('user_data') ?? {};
    //print("Stored user data at startup: $userData");

    if (userData['isLoggedIn'] == true) {
      _navigateToHome(context, userData['userType']);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfteronboardScreen()));
    }
  }

  void _navigateToHome(BuildContext context, String userType) {
    if (['admin', 'BOD', 'PROJECT', 'APEX', 'ZONE'].contains(userType)) {
      CustomSnackbar.showSnackbar(context, 'Welcome back!', backgroundColor: Colors.green);
      Navigator.pushReplacement(
        context,
        AnimatedPageTransition(page: const TripLinkBottomNavigation(), transitionType: TransitionType.zoom),
      );
    } else {
      CustomSnackbar.showSnackbar(context, 'User not verified!\nPlease contact Admin.', backgroundColor: Colors.orange);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfteronboardScreen()));
    }
  }

  String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  bool verifyPassword(String password, String hashedPassword) {
    return BCrypt.checkpw(password, hashedPassword);
  }
}
